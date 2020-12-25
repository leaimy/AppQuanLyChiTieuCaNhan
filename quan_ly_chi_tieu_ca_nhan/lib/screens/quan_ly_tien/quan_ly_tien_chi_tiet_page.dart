import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/card_ThongKeItem.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/circle_icon_box.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/nut_bam.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/rounded_summary_box.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/transaction_iten.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/chi_tieu/lich_su_chi_tieu_page.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/quan_ly_tien/them_khoan_thu_page.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/constants.dart';

class QuanLyTienChiTietPage extends StatelessWidget {
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
              Card(
                elevation: 5.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ThongKeItem(
                      textName: 'Số tiền đang quản lý',
                      textNumber: '2.500.000 VND',
                      colorName: Colors.purple[300],
                      colorNumber: Colors.red[700],
                    ),
                    SizedBox(width: 10.0),
                    CircleIconBox(
                      icon: FontAwesomeIcons.plus,
                      color: Colors.lightGreen,
                      size: 20.0,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return ThemKhoanThuPage();
                          }),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedSummaryBox(
                    title: 'Số dư',
                    money: '500.000 ₫',
                    icon: Icons.euro,
                    iconColor: Colors.green.shade800,
                    iconBgColor: Colors.green.shade200,
                  ),
                  SizedBox(width: 20.0),
                  RoundedSummaryBox(
                    title: 'Tổng chi',
                    money: '2.000.000 ₫',
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
                    money: '20/10/2020',
                    icon: Icons.date_range,
                    iconColor: Colors.blue.shade800,
                    iconBgColor: Colors.blue.shade200,
                  ),
                  SizedBox(width: 20.0),
                  RoundedSummaryBox(
                    title: 'Còn lại',
                    money: '15 ngày',
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
                    money: '50.000 ₫',
                    icon: Icons.warning,
                    iconColor: Colors.orange.shade800,
                    iconBgColor: Colors.orange.shade200,
                  ),
                  SizedBox(width: 20.0),
                  RoundedSummaryBox(
                    title: 'Số ngày vượt mức',
                    money: '5',
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
                children: [
                  TransactionItem(
                    barColor: Colors.pinkAccent,
                    icon: Icons.eco,
                    iconColor: Colors.purpleAccent,
                    amount: '+1.500.000',
                    title: 'Ba mẹ gửi',
                    textColor: Colors.green,
                  ),
                  TransactionItem(
                    barColor: Colors.greenAccent,
                    icon: Icons.account_balance_sharp,
                    iconColor: Colors.lightBlue,
                    amount: '0',
                    title: 'Học bổng',
                    textColor: Colors.green,
                  ),
                  TransactionItem(
                    barColor: Colors.red,
                    icon: Icons.party_mode,
                    iconColor: Colors.orange,
                    amount: '+500.000',
                    title: 'Công việc',
                    textColor: Colors.green,
                  ),
                  TransactionItem(
                    barColor: Colors.yellow,
                    icon: Icons.play_arrow,
                    iconColor: Colors.orange,
                    amount: '+500',
                    title: 'Thu nhập khác',
                    textColor: Colors.green,
                  ),
                ],
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
