import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChiTietChiTieu {
  int id;
  int chiTieuId;
  String ten;
  String nhom;
  int soTien;
  DateTime createdAt;

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
