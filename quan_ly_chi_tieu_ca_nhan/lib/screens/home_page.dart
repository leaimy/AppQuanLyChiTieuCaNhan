import 'package:flutter/material.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/bottom_navigator.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/card_ThongKeItem.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/card_avatar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 7.0),
          child: Column(
            children: [
              CardAvatar(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigator(
        selectedIndex: 0,
      ),
    );
  }
}
