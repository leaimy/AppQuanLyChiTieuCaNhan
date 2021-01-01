import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/api/quan_ly_tien_api.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/nut_bam.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/rounded_summary_box.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/rounded_summary_card.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/transaction_iten.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/quan_ly_tien_thong_ke_chi_tiet.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/quan_ly_tien_thong_ke_nguon_thu.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/chi_tieu/lich_su_chi_tieu_page.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/quan_ly_tien/them_khoan_thu_page.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/color_picker.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/constants.dart';

class QuanLyTienChiTietPage extends StatefulWidget {
  final int quanLyTienID;

  QuanLyTienChiTietPage({this.quanLyTienID});

  @override
  _QuanLyTienChiTietPageState createState() => _QuanLyTienChiTietPageState();
}

class _QuanLyTienChiTietPageState extends State<QuanLyTienChiTietPage> {
  final dateFormat = new DateFormat('dd-MM-yyyy');
  final currencyFormat = new NumberFormat('###,###,###,###');
  ColorPicker colorPicker = ColorPicker();
  QuanLyTienApi _quanLyTienApi = QuanLyTienApi();

  QuanLyTienThongKeChiTiet thongKe = QuanLyTienThongKeChiTiet();
  List<QuanLyTienThongKeNguonThu> dsNguonThu = [];

  void getThongKe() async {
    QuanLyTienThongKeChiTiet data =
        await _quanLyTienApi.getQuanLyTienThongKeChiTiet(widget.quanLyTienID);

    if (data != null)
      setState(() {
        thongKe = data;
      });
  }

  void getDanhSachNguonThu() async {
    List<QuanLyTienThongKeNguonThu> data = await _quanLyTienApi
        .getQuanLyTienThongKeNguonThuTongQuan(widget.quanLyTienID);

    if (data != null)
      setState(() {
        dsNguonThu = data;
      });
  }

  List<TransactionItem> renderDanhSachNguonThu() {
    List<TransactionItem> widgets = [];

    for (var nguonThu in dsNguonThu) {
      TransactionItem item = TransactionItem(
        barColor: colorPicker.random(),
        icon: nguonThu.icon,
        iconColor: colorPicker.random(),
        amount: '+ ${nguonThu.soTien}',
        title: '${nguonThu.nhom}',
        textColor: Colors.green,
      );

      widgets.add(item);
    }

    return widgets;
  }

  @override
  void initState() {
    getThongKe();
    getDanhSachNguonThu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết kế hoạch quản lý tiền'),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: kPaddingMainPage,
          child: ListView(
            children: [
              RoundedSummaryCard(
                title: 'Số tiền đang quản lý',
                money: '${currencyFormat.format(thongKe.soTienHienCo)} ₫',
                icon: Icons.account_balance,
                iconColor: Colors.green.shade800,
                iconBgColor: Colors.green.shade200,
                titleColor: Colors.purpleAccent,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ThemKhoanThuPage();
                    },
                  ));
                },
              ),
              SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedSummaryBox(
                    title: 'Số dư',
                    money: '${currencyFormat.format(thongKe.soDu)} ₫',
                    icon: Icons.euro,
                    iconColor: Colors.green.shade800,
                    iconBgColor: Colors.green.shade200,
                  ),
                  SizedBox(width: 20.0),
                  RoundedSummaryBox(
                    title: 'Tổng chi',
                    money: '${currencyFormat.format(thongKe.soTienDaSuDung)} ₫',
                    icon: Icons.money_off,
                    iconColor: Colors.red.shade800,
                    iconBgColor: Colors.red.shade200,
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedSummaryBox(
                    title: 'Từ ngày',
                    money: '${dateFormat.format(thongKe.ngayBD)}',
                    icon: Icons.date_range,
                    iconColor: Colors.blue.shade800,
                    iconBgColor: Colors.blue.shade200,
                  ),
                  SizedBox(width: 20.0),
                  RoundedSummaryBox(
                    title: 'Còn lại',
                    money: '${thongKe.soNgayConLai} ngày',
                    icon: Icons.calendar_today,
                    iconColor: Colors.yellow.shade800,
                    iconBgColor: Colors.yellow.shade200,
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedSummaryBox(
                    title: 'Hạn mức chi tiêu',
                    money: '${currencyFormat.format(thongKe.hanMucChiTieu)} ₫',
                    icon: Icons.warning,
                    iconColor: Colors.orange.shade800,
                    iconBgColor: Colors.orange.shade200,
                  ),
                  SizedBox(width: 20.0),
                  RoundedSummaryBox(
                    title: 'Số ngày vượt mức',
                    money: '${thongKe.soNgayVuotMuc}',
                    icon: Icons.warning_sharp,
                    iconColor: Colors.purple.shade800,
                    iconBgColor: Colors.purple.shade200,
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text('Chi tiết các nguồn thu:', style: kTitleTextStyle),
              ),
              SizedBox(height: 10.0),
              Column(
                children: renderDanhSachNguonThu(),
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text('Thống kê các khoản chi:', style: kTitleTextStyle),
              ),
              SizedBox(height: 10.0),
              Column(
                children: [
                  TransactionItem(
                    barColor: Colors.pinkAccent,
                    icon: Icons.eco,
                    iconColor: Colors.purpleAccent,
                    amount: '-1.300.000',
                    title: 'Tiền phòng',
                    textColor: Colors.red,
                  ),
                  TransactionItem(
                    barColor: Colors.greenAccent,
                    icon: Icons.account_balance_sharp,
                    iconColor: Colors.lightBlue,
                    amount: '-500.000',
                    title: 'Thực phẩm',
                    textColor: Colors.red,
                  ),
                  TransactionItem(
                    barColor: Colors.red,
                    icon: Icons.party_mode,
                    iconColor: Colors.orange,
                    amount: '-100.000',
                    title: 'Đồ ăn vặt',
                    textColor: Colors.red,
                  ),
                  TransactionItem(
                    barColor: Colors.yellow,
                    icon: Icons.play_arrow,
                    iconColor: Colors.orange,
                    amount: '-100.000',
                    title: 'Chi tiêu khác',
                    textColor: Colors.red,
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              NutBam(
                textName: 'Xem lịch sử chi tiêu',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LichSuChiTieuPage();
                  }));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
