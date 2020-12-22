import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Icon(
                FontAwesomeIcons.solidBell,
                color: Colors.yellow,
              ),
            )
          ],
          title: Text(
            'Bỏ heo mua sách',
            style: TextStyle(
              fontFamily: 'Lobster',
            ),
          ),
        ),
        body: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Card(
                elevation: 10.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardMucTieuItem(
                      nameLable: 'Tên mục tiêu:',
                      nameText: 'Bỏ heo mua sách',
                      colorLable: Colors.pink[300],
                      colorText: Colors.blue,
                    ),
                    CardMucTieuItem(
                      nameLable: 'Loại tiết kiệm:',
                      nameText: 'Ngày',
                      colorLable: Colors.grey[600],
                      colorText: Colors.yellow[600],
                    ),
                    CardMucTieuItem(
                      nameLable: 'Ngày bắt đầu:',
                      nameText: '20/10/2020',
                      colorLable: Colors.green[400],
                      colorText: Colors.red,
                    ),
                    CardMucTieuItem(
                      nameLable: 'Ngày kết thúc:',
                      nameText: '20/12/2020',
                      colorLable: Colors.purple[300],
                      colorText: Colors.red[300],
                    ),
                    CardMucTieuItem(
                      nameLable: 'Số tiền cần tiết kiệm:',
                      nameText: '500.000 VND',
                      colorLable: Colors.orange[500],
                      colorText: Colors.blue[800],
                    ),
                    CardMucTieuItem(
                      nameLable: 'Mô tả:',
                      nameText: 'Cố lên!!',
                      colorLable: Colors.pinkAccent[400],
                      colorText: Colors.purpleAccent,
                    ),
                    CardMucTieuItem(
                      nameLable: 'Số ngày đã hoàn thành:',
                      nameText: '60',
                      colorLable: Colors.greenAccent,
                      colorText: Colors.red[400],
                    ),
                    CardMucTieuItem(
                      nameLable: 'Số ngày chưa hoàn thành:',
                      nameText: '30',
                      colorLable: Colors.blueGrey,
                      colorText: Colors.pink[200],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            )
          ],
        )),
      ),
    );
  }
}

class CardMucTieuItem extends StatelessWidget {
  final String nameLable;
  final String nameText;
  final Color colorLable;
  final Color colorText;

  CardMucTieuItem(
      {this.nameLable, this.nameText, this.colorLable, this.colorText});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10.0),
        Expanded(
          flex: 6,
          child: Text(
            nameLable,
            style: TextStyle(
              fontFamily: 'Lobster',
              fontSize: 18.0,
              color: colorLable,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Expanded(
          flex: 4,
          child: Text(
            nameText,
            style: TextStyle(
              fontFamily: 'Lobster',
              fontSize: 18.0,
              color: colorText,
            ),
          ),
        )
      ],
    );
  }
}
