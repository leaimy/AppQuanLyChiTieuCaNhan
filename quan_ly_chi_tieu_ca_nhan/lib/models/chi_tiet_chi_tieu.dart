import 'package:flutter/material.dart';

class ChiTietChiTieu {
  int id;
  int chiTieuId;
  String ten;
  String nhom;
  int soTien;
  DateTime createdAt;

  IconData get icon {
    if (nhom == 'Áo quần') return Icons.ad_units;
    if (nhom == 'Bạn bè') return Icons.network_cell;
    if (nhom == 'Ăn uống') return Icons.food_bank;
    if (nhom == 'Đi chợ') return Icons.store;

    return Icons.ac_unit;
  }

  ChiTietChiTieu({
    this.id = 0,
    this.chiTieuId = 0,
    this.ten = '',
    this.nhom = '',
    this.soTien = 0,
    DateTime createdAt,
  }) : this.createdAt = createdAt ?? DateTime.now();

  factory ChiTietChiTieu.fromJson(Map<String, dynamic> json) {
    return ChiTietChiTieu(
      id: json['id'],
      chiTieuId: json['chiTieuId'],
      ten: json['ten'].toString(),
      nhom: json['nhom'].toString(),
      soTien: json['soTien'],
      createdAt: DateTime.parse(json['createdAt'].toString()),
    );
  }
}
