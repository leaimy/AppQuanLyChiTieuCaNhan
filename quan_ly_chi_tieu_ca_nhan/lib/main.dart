import 'package:flutter/material.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/card_ThongKeItem.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 7.0),
            child: Column(
              children: [
                Card(
                  elevation: 10.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ThongKeItem(
                        textName: 'Tổng tiền tiết kiệm',
                        textNumber: '500.000 VND',
                        colorName: Colors.purple[300],
                        colorNumber: Colors.red[700],
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
                            textName: 'Số mục tiêu\nhoàn thành',
                            textNumber: '3',
                            colorName: Colors.blue[400],
                            colorNumber: Colors.pink[300],
                          ),
                          ThongKeItem(
                            textName: 'Số mục tiêu\nchưa hoàn thành',
                            textNumber: '2',
                            colorName: Colors.orange[400],
                            colorNumber: Colors.green[600],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
