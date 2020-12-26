import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/muctieu_Item.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/nut_bam.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/rounded_summary_box.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/rounded_summary_card.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/quan_ly_tien/quan_ly_tien_chi_tiet_page.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/quan_ly_tien/them_quan_ly_tien.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/constants.dart';

class QuanLyTienTatCaTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: kPaddingMainPage,
      child: ListView(
        children: [
          RoundedSummaryCard(
            title: 'Tổng số tiền đã quản lý',
            money: '10.000.000 ₫',
            icon: Icons.account_balance_outlined,
            iconColor: Color(0xFF25555B),
            iconBgColor: Color(0xFFC4F2FF),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(
                  child: ThemQuanLyTienPage(),
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                ),
              );
            },
          ),
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RoundedSummaryBox(
                title: 'Tổng số tiền đã chi tiêu',
                money: '7.000.000 ₫',
                icon: Icons.money_off,
                iconColor: Color(0xFFF2A715),
                iconBgColor: Color(0xFFFFE6D6),
              ),
              SizedBox(width: 20.0),
              RoundedSummaryBox(
                title: 'Số lượng kế hoạch đã hoàn thành',
                money: '4',
                icon: Icons.done_all,
                iconColor: Color(0xFFB886A7),
                iconBgColor: Color(0xFFFFD6F1),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Text(
            'Danh sách kế hoạch quản lý tiền:',
            style: kTitleTextStyle,
          ),
          SizedBox(height: 15.0),
          Container(
            height: 350.0,
            child: ListView(
              children: [
                MuctieuItem(
                  textName: '01/11/2020 - 31/12/2020',
                  textColor: Colors.blue,
                  barColor: Colors.pink[200],
                  icon: FontAwesomeIcons.times,
                  iconColor: Colors.redAccent,
                  onItemPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return QuanLyTienChiTietPage();
                    }));
                  },
                ),
                MuctieuItem(
                  textName: '01/10/2020 - 01/11/2020',
                  textColor: Colors.blue,
                  barColor: Colors.pink[200],
                  icon: FontAwesomeIcons.check,
                  iconColor: Colors.green,
                  onItemPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return QuanLyTienChiTietPage();
                    }));
                  },
                ),
                MuctieuItem(
                  textName: '01/09/2020 - 01/10/2020',
                  textColor: Colors.blue,
                  barColor: Colors.pink[200],
                  icon: FontAwesomeIcons.check,
                  iconColor: Colors.green,
                  onItemPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return QuanLyTienChiTietPage();
                    }));
                  },
                ),
                MuctieuItem(
                  textName: '01/08/2020 - 01/09/2020',
                  textColor: Colors.blue,
                  barColor: Colors.pink[200],
                  icon: FontAwesomeIcons.check,
                  iconColor: Colors.green,
                  onItemPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return QuanLyTienChiTietPage();
                    }));
                  },
                ),
                MuctieuItem(
                  textName: '01/07/2020 - 01/08/2020',
                  textColor: Colors.blue,
                  barColor: Colors.pink[200],
                  icon: FontAwesomeIcons.check,
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
        ],
      ),
    );
  }
}
