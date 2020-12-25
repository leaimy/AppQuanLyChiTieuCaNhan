import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/card_avatar.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/circle_icon_box.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/constants.dart';

class HomeTab extends StatelessWidget {
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
      child: Column(children: [
        Opacity(
          opacity: 0.7,
          child: Row(
            children: [
              Expanded(
                child: CardAvatar(),
              ),
              SizedBox(width: 10.0),
              CircleIconBox(
                icon: FontAwesomeIcons.signOutAlt,
                size: 30.0,
                color: Colors.pinkAccent,
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ]),
    );
  }
}
