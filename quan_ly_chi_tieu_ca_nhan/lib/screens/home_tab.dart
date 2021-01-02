import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/card_avatar.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/circle_icon_box.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/nguoi_dung.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/chi_tieu/them_chi_tieu_page.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/constants.dart';

class HomeTab extends StatelessWidget {
  final NguoiDung nguoiDung;
  HomeTab({this.nguoiDung});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kPaddingMainPage,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Opacity(
            opacity: 0.7,
            child: Row(
              children: [
                Expanded(
                  child: CardAvatar(
                    tenHienThi: nguoiDung.tenHienThi,
                    tenHinh: nguoiDung.avatar,
                  ),
                ),
                SizedBox(width: 10.0),
                CircleIconBox(
                  icon: FontAwesomeIcons.signOutAlt,
                  size: 30.0,
                  color: Colors.pinkAccent,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          Opacity(
            opacity: 0.7,
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(20.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 20.0,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 35.0,
                      height: 35.0,
                      child: CircleAvatar(
                        child: Icon(
                          Icons.store_mall_directory,
                          color: Colors.pink[800],
                        ),
                        backgroundColor: Colors.pink[100],
                      ),
                    ),
                    SizedBox(width: 15.0),
                    Text(
                      'Thêm chi tiêu hôm nay',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontFamily: 'Lobster',
                      ),
                    ),
                    Expanded(child: Container()),
                    CircleIconBox(
                      icon: Icons.add,
                      color: Colors.green,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
