import 'package:flutter/material.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/card_ThongKeItem.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/muctieu_Item.dart';

class IncomeAllScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            elevation: 10.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ThongKeItem(
                  textName: 'Tổng số tiền đã thu',
                  textNumber: '10.500.000 VND',
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
                      textName: 'Số dư',
                      textNumber: '+2.500.000',
                      colorName: Colors.green,
                      colorNumber: Colors.green,
                    ),
                    ThongKeItem(
                      textName: 'Tổng chi',
                      textNumber: '-8.000.000',
                      colorName: Colors.red,
                      colorNumber: Colors.red,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Danh sách chi tiết các khoản thu:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              letterSpacing: 1.3,
            ),
          ),
          SizedBox(height: 10.0),
          Expanded(
            child: ListView(
              children: [
                MuctieuItem(
                  textName: '01/12/2020 - 31/12/2020',
                  textColor: Colors.blue,
                  barColor: Colors.lightBlue,
                  icon: Icons.add,
                  iconColor: Colors.green,
                ),
                MuctieuItem(
                  textName: '01/12/2020 - 31/12/2020',
                  textColor: Colors.blue,
                  barColor: Colors.lightBlue,
                  icon: Icons.add,
                  iconColor: Colors.green,
                ),
                MuctieuItem(
                  textName: '01/12/2020 - 31/12/2020',
                  textColor: Colors.blue,
                  barColor: Colors.lightBlue,
                  icon: Icons.add,
                  iconColor: Colors.green,
                ),
                MuctieuItem(
                  textName: '01/12/2020 - 31/12/2020',
                  textColor: Colors.blue,
                  barColor: Colors.lightBlue,
                  icon: Icons.add,
                  iconColor: Colors.green,
                ),
                MuctieuItem(
                  textName: '01/12/2020 - 31/12/2020',
                  textColor: Colors.blue,
                  barColor: Colors.lightBlue,
                  icon: Icons.add,
                  iconColor: Colors.green,
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
                onPressed: () {},
                minWidth: 200.0,
                height: 42.0,
                child: Text(
                  'Thêm quản lý thu nhập mới',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
