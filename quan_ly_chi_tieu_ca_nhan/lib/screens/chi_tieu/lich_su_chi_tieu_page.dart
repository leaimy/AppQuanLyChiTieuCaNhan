import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/api/chi_tieu_api.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/outcome_date_box.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/rounded_summary_card.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/transaction_iten.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/chi_tiet_chi_tieu.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/chi_tieu.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/chi_tieu/them_chi_tieu_page.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/constants.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/color_picker.dart';

class LichSuChiTieuPage extends StatefulWidget {
  final int quanLyTienID;
  final int idNguoiDung;
  final Function onChanged;

  LichSuChiTieuPage({
    @required this.quanLyTienID,
    @required this.idNguoiDung,
    this.onChanged,
  });

  @override
  _LichSuChiTieuPageState createState() => _LichSuChiTieuPageState();
}

class _LichSuChiTieuPageState extends State<LichSuChiTieuPage> {
  final dateFormat = new DateFormat('dd-MM-yyyy');
  final currencyFormat = new NumberFormat('###,###,###,###');
  final colorPicker = ColorPicker();
  ChiTieuAPI chiTieuAPI = ChiTieuAPI();

  List<ChiTieu> dsChiTieu = [];
  List<ChiTietChiTieu> dsChiTietChiTieu = [];
  DateTime ngayChiTieu = DateTime.now();
  int tongTienChiTieu = 0;
  int currentSelectedIndex = 0;

  Future<void> getDanhSachChiTieu() async {
    var data = await chiTieuAPI.layDanhSachChiTieu(widget.quanLyTienID);

    if (data != null) {
      List<ChiTietChiTieu> raw = [];
      if (data.length > 0) {
        raw = await chiTieuAPI.layDanhSachChiTietChiTieu(data[0].id);
      }

      setState(() {
        dsChiTieu = data;
        if (data.length > 0) {
          dsChiTieu[0].isSelected = true;
          ngayChiTieu = dsChiTieu[0].ngay;
          tongTienChiTieu = dsChiTieu[0].tongChi;
        }
        if (raw != null) dsChiTietChiTieu = raw;
      });
    }
  }

  Future<void> getDanhSachChiTietChiTieu(int chiTieuId) async {
    var data = await chiTieuAPI.layDanhSachChiTietChiTieu(chiTieuId);

    if (data != null) {
      setState(() {
        dsChiTietChiTieu = data;
      });
    }
  }

  void handleOnDateBoxPressed(int selectedIndex) {
    if (currentSelectedIndex == selectedIndex) return;

    currentSelectedIndex = selectedIndex;

    for (var chiTieu in dsChiTieu) {
      chiTieu.isSelected = false;
    }

    setState(() {
      ngayChiTieu = dsChiTieu[selectedIndex].ngay;
      tongTienChiTieu = dsChiTieu[selectedIndex].tongChi;
      dsChiTieu[selectedIndex].isSelected = true;
    });

    int chiTieuId = dsChiTieu[selectedIndex].id;

    getDanhSachChiTietChiTieu(chiTieuId);
  }

  @override
  void initState() {
    getDanhSachChiTieu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lịch sử chi tiêu'),
      ),
      body: SafeArea(
        child: Container(
          padding: kPaddingMainPage,
          color: Colors.white,
          child: ListView(
            children: [
              RoundedSummaryCard(
                title:
                    'Tổng tiền chi tiêu ngày\n ${dateFormat.format(ngayChiTieu)}',
                money: '${currencyFormat.format(tongTienChiTieu)} ₫',
                icon: Icons.money_off,
                iconColor: Colors.red.shade800,
                iconBgColor: Colors.red.shade200,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ThemChiTieuPage(
                        idNguoiDung: widget.idNguoiDung,
                        onSuccess: () {
                          getDanhSachChiTieu();
                          if (widget.onChanged != null) widget.onChanged();
                        },
                      );
                    },
                  ));
                },
              ),
              SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text('Ngày:', style: kTitleTextStyle),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 110.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dsChiTieu.length,
                  itemBuilder: (context, index) {
                    return OutcomeDate(
                      date: '${dsChiTieu[index].ngay.day}',
                      month: 'Tháng ${dsChiTieu[index].ngay.month}',
                      isSelected: dsChiTieu[index].isSelected,
                      onPressed: () {
                        handleOnDateBoxPressed(index);
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 25.0),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text('Chi tiết giao dịch:', style: kTitleTextStyle),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 350.0,
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 5.0),
                  itemCount: dsChiTietChiTieu.length,
                  itemBuilder: (context, index) {
                    return TransactionItem(
                      barColor: colorPicker.random(),
                      icon: dsChiTietChiTieu[index].icon,
                      iconColor: dsChiTietChiTieu[index].iconColor,
                      amount:
                          '- ${currencyFormat.format(dsChiTietChiTieu[index].soTien)}',
                      title: '${dsChiTietChiTieu[index].ten}',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
