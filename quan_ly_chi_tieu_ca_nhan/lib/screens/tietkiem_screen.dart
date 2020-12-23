import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/bottom_navigator.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/card_ThongKeItem.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/muctieu_Item.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/nut_bam.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/chi_tiet_muc_tieu_tiet_kiem_screen.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/them_muc_tieu_screen.dart';

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
                    onItemPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ChiTietMucTieuTietKiemScreen();
                      }));
                    },
                  ),
                  MuctieuItem(
                    barColor: Colors.pink[200],
                    textColor: Colors.blue[200],
                    iconColor: Colors.green,
                    textName: 'Bỏ heo mua sách',
                    icon: FontAwesomeIcons.check,
                    onItemPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ChiTietMucTieuTietKiemScreen();
                      }));
                    },
                  ),
                ],
              )),
              NutBam(
                textName: 'Thêm mục tiêu tiết kiệm',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ThemMucTieuScreen();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigator(
        selectedIndex: 1,
      ),
    );
  }
}
