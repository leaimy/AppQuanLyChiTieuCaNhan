import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuanLyTienThongKeNguonThu {
  int soTien;
  String nhom;

  IconData get icon {
    if (nhom == 'Gia đình') return FontAwesomeIcons.home;
    if (nhom == 'Bạn bè') return FontAwesomeIcons.userFriends;
    if (nhom == 'Học bổng') return Icons.leaderboard;

    return FontAwesomeIcons.chartPie;
  }

  Color get iconColor {
    if (nhom == 'Gia đình') return Colors.red;
    if (nhom == 'Bạn bè') return Colors.purple;
    if (nhom == 'Học bổng') return Colors.orange;

    return Colors.amber;
  }

  QuanLyTienThongKeNguonThu({
    this.soTien = 0,
    this.nhom = "khác",
  });

  factory QuanLyTienThongKeNguonThu.fromJson(Map<String, dynamic> json) {
    return QuanLyTienThongKeNguonThu(
      soTien: int.parse(json['soTien'].toString()),
      nhom: json['nhom'].toString(),
    );
  }
}
