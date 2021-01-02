import 'package:flutter/material.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/circle_icon_box.dart';

class QuickActionBox extends StatelessWidget {
  final Icon icon;
  final Text title;
  final double iconSize;
  final Color iconBackGroundColor;
  final CircleIconBox actionIcon;

  QuickActionBox({
    @required this.icon,
    @required this.actionIcon,
    @required this.title,
    this.iconSize = 35.0,
    this.iconBackGroundColor = Colors.pinkAccent,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
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
              width: this.iconSize,
              height: this.iconSize,
              child: CircleAvatar(
                child: this.icon,
                backgroundColor: this.iconBackGroundColor,
              ),
            ),
            SizedBox(width: 15.0),
            this.title,
            Expanded(child: Container()),
            this.actionIcon,
          ],
        ),
      ),
    );
  }
}
