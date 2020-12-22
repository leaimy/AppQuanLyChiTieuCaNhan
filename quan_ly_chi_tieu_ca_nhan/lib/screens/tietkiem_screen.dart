import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/card_ThongKeItem.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/muctieu_Item.dart';

class TietKiemScreen extends StatelessWidget {
  const TietKiemScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 7.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              Expanded(
                  child: ListView(
                children: [
                  MuctieuItem(
                    barColor: Colors.green,
                    textColor: Colors.pink,
                    iconColor: Colors.yellow,
                    textName: 'Bỏ heo mua mũ',
                    icon: FontAwesomeIcons.crown,
                  ),
                  MuctieuItem(
                    barColor: Colors.pink[200],
                    textColor: Colors.blue[200],
                    iconColor: Colors.green,
                    textName: 'Bỏ heo mua sách',
                    icon: FontAwesomeIcons.check,
                  ),
                ],
              )),
              FlatButton(
                  onPressed: null,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.pink[600],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50.0,
                        vertical: 10.0,
                      ),
                      child: Text(
                        'Thêm mục tiêu tiết kiệm',
                        style: TextStyle(
                          fontSize: 18.0,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Lobster',
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
