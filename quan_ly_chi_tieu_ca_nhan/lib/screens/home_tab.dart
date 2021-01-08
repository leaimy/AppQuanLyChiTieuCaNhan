import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/card_avatar.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/circle_icon_box.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/quick_action_box.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/nguoi_dung.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/chi_tieu/them_chi_tieu_page.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/quan_ly_tiet_kiem/them_muc_tieu_tiet_kiem_page.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/services/LocalNotifyManager.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/constants.dart';

class HomeTab extends StatefulWidget {
  final NguoiDung nguoiDung;
  HomeTab({this.nguoiDung});

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  LocalNotifyManager localNotifyManager;

  @override
  void initState() {
    super.initState();
    localNotifyManager = LocalNotifyManager.init();
    localNotifyManager.setOnNotificationReceive(onNotificationReceive);
    localNotifyManager.setOnNotificationClick(onNotificationClick);
  }

  onNotificationReceive(ReceiveNotification notification) {
    print('Notication Received: ${notification.id}');
  }

  onNotificationClick(String payload) {
    print('Payload $payload');
  }

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
                    tenHienThi: widget.nguoiDung.tenHienThi,
                    tenHinh: widget.nguoiDung.avatar,
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
            child: QuickActionBox(
              icon: Icon(
                Icons.card_travel,
                color: Colors.pink[800],
              ),
              title: Text(
                'Thêm mục tiêu tiết kiệm ngay 😆',
                style: TextStyle(fontFamily: 'Lobster'),
              ),
              iconBackGroundColor: Colors.pink[100],
              actionIcon: CircleIconBox(
                icon: Icons.add,
                color: Colors.green,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ThemMucTieuTietKiemPage(
                      idNguoiDung: widget.nguoiDung.id,
                    );
                  }));
                },
              ),
            ),
          ),
          SizedBox(height: 15.0),
          Opacity(
            opacity: 0.7,
            child: QuickActionBox(
              icon: Icon(
                Icons.shopping_bag,
                color: Colors.pink[800],
              ),
              title: Text(
                'Thêm chi tiêu hôm nay 😙',
                style: TextStyle(fontFamily: 'Lobster'),
              ),
              iconBackGroundColor: Colors.pink[100],
              actionIcon: CircleIconBox(
                icon: Icons.add,
                color: Colors.green,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ThemChiTieuPage(
                      idNguoiDung: widget.nguoiDung.id,
                    );
                  }));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
