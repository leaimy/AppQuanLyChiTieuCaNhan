import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quan_ly_chi_tieu_ca_nhan/models/list_quan_ly_tien.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/quan_ly_tien_thong_ke_chi_tiet.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/quan_ly_tien_thong_ke_khoan_chi.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/quan_ly_tien_thong_ke_nguon_thu.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/quan_ly_tien_thong_ke_tong_quan.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/constants.dart';

class QuanLyTienApi {
  final String _url = "$kURL/api/quanlytien";
  final String _urlThongKeTongQuan = '$kURL/api/quanlytien/thongketongquan';
  final String _urlThongKeChiTiet = '$kURL/api/quanlytien/thongkechitiet';
  final String _urlThongKeNguonThuTongQuan =
      '$kURL/api/quanlytien/thongkenguonthu';
  final String _urlThongKeKhoanchiTongQuan =
      '$kURL/api/quanlytien/thongkekhoanchi';
  final String _urlThemNguonThu = "$kURL/api/quanlytien/nguonthu";

  dynamic myEncode(dynamic item) {
    if (item is DateTime) {
      return item.toIso8601String();
    }
    return item;
  }

  Future<List<ListQuanLyTien>> getAllQuanLyTien(int userID) async {
    http.Response response = await http.get(
      '$_url?user_id=$userID',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) return null;

    List<dynamic> list = jsonDecode(response.body);

    List<ListQuanLyTien> dsQuanLyTien = [];
    for (var json in list) {
      ListQuanLyTien quanLyTien = ListQuanLyTien.fromJson(json);
      dsQuanLyTien.add(quanLyTien);
    }

    return dsQuanLyTien;
  }

  Future<QuanLyTienThongKeTongQuan> getQuanLyTienThongKeTongQuan(
      int userID) async {
    http.Response response = await http.get(
      '$_urlThongKeTongQuan?user_id=$userID',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) return null;

    return QuanLyTienThongKeTongQuan.fromJson(jsonDecode(response.body));
  }

  Future<QuanLyTienThongKeChiTiet> getQuanLyTienThongKeChiTiet(
      int quanLyTienID) async {
    http.Response response = await http.get(
      '$_urlThongKeChiTiet?quanlytien_id=$quanLyTienID',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) return null;

    return QuanLyTienThongKeChiTiet.fromJson(jsonDecode(response.body));
  }

  Future<List<QuanLyTienThongKeNguonThu>> getQuanLyTienThongKeNguonThuTongQuan(
      int quanLyTienID) async {
    http.Response response = await http.get(
      '$_urlThongKeNguonThuTongQuan?quanlytien_id=$quanLyTienID',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) return null;

    List<dynamic> list = jsonDecode(response.body);

    List<QuanLyTienThongKeNguonThu> dsNguonThu = [];
    for (var json in list) {
      QuanLyTienThongKeNguonThu nguonThu =
          QuanLyTienThongKeNguonThu.fromJson(json);
      dsNguonThu.add(nguonThu);
    }

    return dsNguonThu;
  }

  Future<List<QuanLyTienThongKeKhoanChi>> getQuanLyTienThongKeKhoanChiTongQuan(
      int quanLyTienID) async {
    http.Response response = await http.get(
      '$_urlThongKeKhoanchiTongQuan?quanlytien_id=$quanLyTienID',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) return null;

    List<dynamic> list = jsonDecode(response.body);

    List<QuanLyTienThongKeKhoanChi> dsKhoanChi = [];
    for (var json in list) {
      QuanLyTienThongKeKhoanChi khoanChi =
          QuanLyTienThongKeKhoanChi.fromJson(json);
      dsKhoanChi.add(khoanChi);
    }

    return dsKhoanChi;
  }

  Future<bool> themQuanLyTien(
      {int idNguoiDung, DateTime ngayBD, DateTime ngayKT}) async {
    var body = {
      "IdNguoiDung": idNguoiDung,
      "NgayBD": ngayBD,
      "NgayKT": ngayKT,
    };

    var bodyJson = JsonEncoder(myEncode).convert(body);
    http.Response response = await http.post(
      _url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: bodyJson,
    );

    print(bodyJson);
    print(response.statusCode);

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> themNguonThu({int idQuanLyTien, int soTien, String nhom}) async {
    var body = {
      "QuanLyTienID": idQuanLyTien,
      "SoTien": soTien,
      "Nhom": nhom,
    };

    var bodyJson = jsonEncode(body);
    http.Response response = await http.post(
      _urlThemNguonThu,
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
