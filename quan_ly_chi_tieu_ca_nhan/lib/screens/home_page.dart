import 'package:flutter/material.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/card_ThongKeItem.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/card_avatar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 7.0),
        child: Column(
          children: [
            CardAvatar(),
            SizedBox(
              height: 25.0,
            ),
            Card(
              elevation: 10.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ThongKeItem(
                    textName: 'Số tiền còn lại',
                    textNumber: '200.000 VND',
                    colorName: Colors.purple[300],
                    colorNumber: Colors.red[700],
                  ),
                  SizedBox(
                    width: 350.0,
                    height: 1.0,
                    child: const DecoratedBox(
                      decoration: const BoxDecoration(color: Color(0xFFE0E0E0)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ThongKeItem(
                        textName: 'Tổng thu',
                        textNumber: '2.500.000 VND',
                        colorName: Colors.blue[400],
                        colorNumber: Colors.pink[300],
                      ),
                      ThongKeItem(
                        textName: 'Tổng chi',
                        textNumber: '2.300.000 VND',
                        colorName: Colors.orange[400],
                        colorNumber: Colors.green[600],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
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
                      decoration: const BoxDecoration(color: Color(0xFFE0E0E0)),
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
        ));
  }
}
