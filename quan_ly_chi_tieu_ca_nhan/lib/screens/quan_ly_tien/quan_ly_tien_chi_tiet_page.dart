import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/card_ThongKeItem.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/circle_icon_box.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/nut_bam.dart';
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                    SizedBox(
                      width: 350.0,
                      height: 1.0,
                      child: const DecoratedBox(
                        decoration:
                            const BoxDecoration(color: Color(0xFFE0E0E0)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ThongKeItem(
                          textName: 'Số dư',
                          textNumber: '+500.000',
                          colorName: Colors.green,
                          colorNumber: Colors.green,
                        ),
                        ThongKeItem(
                          textName: 'Tổng chi',
                          textNumber: '-2.000.000',
                          colorName: Colors.red,
                          colorNumber: Colors.red,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 350.0,
                      height: 1.0,
                      child: const DecoratedBox(
                        decoration:
                            const BoxDecoration(color: Color(0xFFE0E0E0)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ThongKeItem(
                          textName: 'Từ ngày',
                          textNumber: '20/10/2020',
                          colorName: Colors.blueAccent,
                          colorNumber: Colors.lightBlueAccent,
                        ),
                        ThongKeItem(
                          textName: 'Đến ngày',
                          textNumber: '20/11/2020',
                          colorName: Colors.blueAccent,
                          colorNumber: Colors.lightBlueAccent,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 350.0,
                      height: 1.0,
                      child: const DecoratedBox(
                        decoration:
                            const BoxDecoration(color: Color(0xFFE0E0E0)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ThongKeItem(
                          textName: 'Hạn mức chi tiêu',
                          textNumber: '50.000',
                          colorName: Colors.blueAccent,
                          colorNumber: Colors.lightBlueAccent,
                        ),
                        ThongKeItem(
                          textName: 'Số ngày vượt',
                          textNumber: '5',
                          colorName: Colors.red,
                          colorNumber: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.0),
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
              SizedBox(height: 25.0),
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
