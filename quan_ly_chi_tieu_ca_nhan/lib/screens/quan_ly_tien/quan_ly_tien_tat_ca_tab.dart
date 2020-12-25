import 'package:flutter/material.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/card_ThongKeItem.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/muctieu_Item.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/nut_bam.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/chi_tieu/them_chi_tieu_page.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/quan_ly_tien/quan_ly_tien_chi_tiet_page.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/constants.dart';

class QuanLyTienTatCaTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
              style: kTitleTextStyle,
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView(
                children: [
                  MuctieuItem(
                    textName: '01/12/2020 - 31/12/2020',
                    textColor: Colors.blue,
                    barColor: Colors.pink[200],
                    icon: Icons.add,
                    iconColor: Colors.green,
                    onItemPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return QuanLyTienChiTietPage();
                      }));
                    },
                  ),
                  MuctieuItem(
                    textName: '01/12/2020 - 31/12/2020',
                    textColor: Colors.blue,
                    barColor: Colors.pink[200],
                    icon: Icons.add,
                    iconColor: Colors.green,
                    onItemPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return QuanLyTienChiTietPage();
                      }));
                    },
                  ),
                  MuctieuItem(
                    textName: '01/12/2020 - 31/12/2020',
                    textColor: Colors.blue,
                    barColor: Colors.pink[200],
                    icon: Icons.add,
                    iconColor: Colors.green,
                    onItemPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return QuanLyTienChiTietPage();
                      }));
                    },
                  ),
                  MuctieuItem(
                    textName: '01/12/2020 - 31/12/2020',
                    textColor: Colors.blue,
                    barColor: Colors.pink[200],
                    icon: Icons.add,
                    iconColor: Colors.green,
                    onItemPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return QuanLyTienChiTietPage();
                      }));
                    },
                  ),
                  MuctieuItem(
                    textName: '01/12/2020 - 31/12/2020',
                    textColor: Colors.blue,
                    barColor: Colors.pink[200],
                    icon: Icons.add,
                    iconColor: Colors.green,
                    onItemPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return QuanLyTienChiTietPage();
                      }));
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            NutBam(
                textName: 'Thêm chi tiêu mới',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ThemChiTieuPage();
                  }));
                })
          ],
        ),
      ),
    );
  }
}