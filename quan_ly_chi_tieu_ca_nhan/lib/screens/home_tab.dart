import 'package:flutter/material.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/card_avatar.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 10.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Opacity(opacity: 0.8, child: CardAvatar()),
          ],
        ),
      ),
    );
  }
}