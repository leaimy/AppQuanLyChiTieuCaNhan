import 'package:flutter/material.dart';

class QuanLyTienThongKeNguonThu {
  int soTien;
  String nhom;

  IconData get icon {
    if (nhom == 'Ba mẹ') return Icons.people;
    if (nhom == 'Bạn bè') return Icons.network_cell;
    if (nhom == 'Học bổng') return Icons.leaderboard;

    return Icons.ac_unit;
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
