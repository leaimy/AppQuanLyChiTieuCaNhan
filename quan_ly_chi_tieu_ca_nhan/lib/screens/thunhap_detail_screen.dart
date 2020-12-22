import 'package:flutter/material.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/card_ThongKeItem.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/transaction_iten.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/lich_su_chi_tieu_screen.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/them_thu_nhap_screen.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/constants.dart';

class IncomeDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: ListView(
            children: [
              Card(
                elevation: 10.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ThongKeItem(
                          textName: 'Tổng số dư hiện tại',
                          textNumber: '+500.000 VND',
                          colorName: Colors.purple[300],
                          colorNumber: Colors.red[700],
                        ),
                        SizedBox(width: 10.0),
                        GestureDetector(
                          child: Icon(Icons.edit),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return AddIncomeScreen();
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
                          textName: 'Tổng thu ban đầu',
                          textNumber: '+2.500.000',
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
                  ],
                ),
              ),
              SizedBox(height: 25.0),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text('Chi tiết nguồn thu:', style: kTitleTextStyle),
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: Column(
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
              ),
              SizedBox(height: 25.0),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text('Thống kê khoản chi:', style: kTitleTextStyle),
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: Column(
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
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  elevation: 5.0,
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return OutcomeHistory();
                      }));
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Xem chi tiết các khoản chi theo ngày',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
