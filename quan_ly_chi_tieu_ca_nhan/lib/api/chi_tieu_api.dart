import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quan_ly_chi_tieu_ca_nhan/models/chi_tiet_chi_tieu.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/chi_tieu.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/constants.dart';

class ChiTieuAPI {
  final String _urlChiTieu = "$kURL/api/chitieu";
  final String _urlChiTietChiTieu = '$kURL/api/chitieu/chitiet';

  Future<List<ChiTieu>> layDanhSachChiTieu(int quanLyTienId) async {
    final http.Response response = await http.get(
      '$_urlChiTieu?quanlytien_id=$quanLyTienId',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) return null;

    List<dynamic> list = jsonDecode(response.body);

    List<ChiTieu> dsChiTieu = [];
    for (var json in list) {
      ChiTieu chiTieu = ChiTieu.fromJson(json);
      dsChiTieu.add(chiTieu);
    }

    return dsChiTieu;
  }

  Future<List<ChiTietChiTieu>> layDanhSachChiTietChiTieu(int chiTieuId) async {
    final http.Response response = await http.get(
      '$_urlChiTietChiTieu?chitieu_id=$chiTieuId',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) return null;

    List<dynamic> list = jsonDecode(response.body);

    List<ChiTietChiTieu> dsChiTietChiTieu = [];
    for (var json in list) {
      ChiTietChiTieu chiTietChiTieu = ChiTietChiTieu.fromJson(json);
      dsChiTietChiTieu.add(chiTietChiTieu);
    }

    return dsChiTietChiTieu;
  }

  Future<bool> themChiTieu(
      {String nhom,
      String tenChiTieu,
      int soTien,
      DateTime ngayChiTieu}) async {
    var body = {
      "Nhom": nhom,
      "TenChiTieu": tenChiTieu,
      "SoTien": soTien,
      "NgayChiTieu": ngayChiTieu,
    };

    var bodyJson = jsonEncode(body);
    http.Response response = await http.post(
      _urlChiTieu,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: bodyJson,
    );

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
