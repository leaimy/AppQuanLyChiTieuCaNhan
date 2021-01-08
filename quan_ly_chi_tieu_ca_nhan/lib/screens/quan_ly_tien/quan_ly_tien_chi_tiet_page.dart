import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/api/quan_ly_tien_api.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/nut_bam.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/rounded_summary_box.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/rounded_summary_card.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/transaction_iten.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/quan_ly_tien_thong_ke_chi_tiet.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/quan_ly_tien_thong_ke_khoan_chi.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/quan_ly_tien_thong_ke_nguon_thu.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/chi_tieu/lich_su_chi_tieu_page.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/quan_ly_tien/them_khoan_thu_page.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/color_picker.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/constants.dart';

class QuanLyTienChiTietPage extends StatefulWidget {
  final int quanLyTienID;
  final int idNguoiDung;
  final Function onChanged;

  QuanLyTienChiTietPage({
    @required this.quanLyTienID,
    @required this.idNguoiDung,
    this.onChanged,
  });

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
  List<QuanLyTienThongKeKhoanChi> dsKhoanChi = [];

  void getThongKe() async {
    QuanLyTienThongKeChiTiet data =
        await _quanLyTienApi.getQuanLyTienThongKeChiTiet(widget.quanLyTienID);

    if (data != null) {
      setState(() {
        thongKe = data;
      });
    }
  }

  void getDanhSachNguonThu() async {
    List<QuanLyTienThongKeNguonThu> data = await _quanLyTienApi
        .getQuanLyTienThongKeNguonThuTongQuan(widget.quanLyTienID);

    if (data != null) {
      setState(() {
        dsNguonThu = data;
      });
    }
  }

  void getDanhSachKhoanChi() async {
    List<QuanLyTienThongKeKhoanChi> data = await _quanLyTienApi
        .getQuanLyTienThongKeKhoanChiTongQuan(widget.quanLyTienID);

    if (data != null) {
      setState(() {
        dsKhoanChi = data;
      });
    }
  }

  List<TransactionItem> renderDanhSachNguonThu() {
    List<TransactionItem> widgets = [];

    for (var nguonThu in dsNguonThu) {
      TransactionItem item = TransactionItem(
        barColor: colorPicker.random(),
        icon: nguonThu.icon,
        iconColor: nguonThu.iconColor,
        amount: '+ ${currencyFormat.format(nguonThu.soTien)}',
        title: '${nguonThu.nhom}',
        textColor: Colors.green,
      );

      widgets.add(item);
    }

    return widgets;
  }

  List<TransactionItem> renderDanhSachKhoanChi() {
    List<TransactionItem> widgets = [];

    for (var khoanChi in dsKhoanChi) {
      TransactionItem item = TransactionItem(
        barColor: colorPicker.random(),
        icon: khoanChi.icon,
        iconColor: khoanChi.iconColor,
        amount: '- ${currencyFormat.format(khoanChi.soTien)}',
        title: '${khoanChi.nhom}',
        textColor: Colors.red,
      );

      widgets.add(item);
    }

    return widgets;
  }

  @override
  void initState() {
    getThongKe();
    getDanhSachNguonThu();
    getDanhSachKhoanChi();
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
                iconBgColor: Colors.blue[200],
                iconColor: Colors.orange,
                titleColor: Colors.purpleAccent,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ThemKhoanThuPage(
                        idQuanLyTien: widget.quanLyTienID,
                        onSuccess: () {
                          getThongKe();
                          getDanhSachNguonThu();
                          getDanhSachKhoanChi();

                          if (widget.onChanged != null) widget.onChanged();
                        },
                      );
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
                children: renderDanhSachKhoanChi(),
              ),
              SizedBox(height: 30.0),
              NutBam(
                textName: 'Xem lịch sử chi tiêu',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LichSuChiTieuPage(
                          quanLyTienID: widget.quanLyTienID,
                          idNguoiDung: widget.idNguoiDung,
                          onChanged: () {
                            getThongKe();
                            getDanhSachNguonThu();
                            getDanhSachKhoanChi();

                            if (widget.onChanged != null) widget.onChanged();
                          },
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
