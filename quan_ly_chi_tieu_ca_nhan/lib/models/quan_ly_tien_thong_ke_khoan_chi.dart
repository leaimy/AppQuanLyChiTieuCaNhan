import 'package:flutter/material.dart';

class QuanLyTienThongKeKhoanChi {
  int soTien;
  String nhom;

  IconData get icon {
    if (nhom == 'Áo quần') return Icons.ad_units;
    if (nhom == 'Bạn bè') return Icons.network_cell;
    if (nhom == 'Ăn uống') return Icons.food_bank;
    if (nhom == 'Đi chợ') return Icons.store;

    return Icons.ac_unit;
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
