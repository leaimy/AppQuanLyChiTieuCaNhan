import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuanLyTienThongKeKhoanChi {
  int soTien;
  String nhom;

  IconData get icon {
    if (nhom == 'Thức ăn') return FontAwesomeIcons.utensils;
    if (nhom == 'Bạn bè') return FontAwesomeIcons.userFriends;
    if (nhom == 'Quần áo') return FontAwesomeIcons.tshirt;
    if (nhom == 'Di chuyển') return FontAwesomeIcons.busAlt;

    return FontAwesomeIcons.chartPie;
  }

  Color get iconColor {
    if (nhom == 'Thức ăn') return Colors.green;
    if (nhom == 'Bạn bè') return Colors.purple;
    if (nhom == 'Quần áo') return Colors.blue;
    if (nhom == 'Di chuyển') return Colors.amber;

    return Colors.pink;
  }

  QuanLyTienThongKeKhoanChi({
    this.soTien = 0,
    this.nhom = "khác",
  });

  factory QuanLyTienThongKeKhoanChi.fromJson(Map<String, dynamic> json) {
    return QuanLyTienThongKeKhoanChi(
      soTien: int.parse(json['soTien'].toString()),
      nhom: json['nhom'].toString(),
    );
  }
}
