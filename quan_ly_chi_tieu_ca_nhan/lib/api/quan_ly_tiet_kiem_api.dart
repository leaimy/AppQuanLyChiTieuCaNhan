import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quan_ly_chi_tieu_ca_nhan/models/chi_tiet_muc_tieu.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/chi_tiet_ngay_tiet_kiem.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/list_muc_tieu.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/thong_ke_tiet_kiem.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/constants.dart';

class MucTieuApi {
  final String _urlMucTieu = "$kURL/api/tietkiem";
  final String _urlThongKe = "$kURL/api/tietkiem/thongketietkiem";
  final String _urlChiTietMucTieu = "$kURL/api/tietkiem/chitietmuctieu";
  final String _urlChiTietNgay = "$kURL/api/tietkiem/chitietngay";

  dynamic myEncode(dynamic item) {
    if (item is DateTime) {
      return item.toIso8601String();
    }
    return item;
  }

  Future<List<MucTieuTietKiem>> getAllMucTieu(int idNguoiDung) async {
    final http.Response response = await http.get(
      '$_urlMucTieu?user_id=$idNguoiDung',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) return [];

    List<dynamic> list = jsonDecode(response.body);

    List<MucTieuTietKiem> dsMucTieu = [];
    for (var item in list) {
      MucTieuTietKiem mucTieu = MucTieuTietKiem.fromJson(item);
      dsMucTieu.add(mucTieu);
    }

    return dsMucTieu;
  }

  Future<ThongKeTietKiem> thongKeTietKiem(int idNguoiDung) async {
    final http.Response response = await http.get(
      '$_urlThongKe?user_id=$idNguoiDung',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) return null;

    return ThongKeTietKiem.fromJson(jsonDecode(response.body));
  }

  Future<ChiTietMucTieu> chiTietMucTieu(int id) async {
    final http.Response response = await http.get(
      '$_urlChiTietMucTieu?id_muctieu=$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) return null;

    return ChiTietMucTieu.fromJson(jsonDecode(response.body));
  }

  Future<List<ChiTietNgayTietKiem>> getNgayTietKiem(int idMucTieu) async {
    final http.Response response = await http.get(
      '$_urlChiTietNgay?id_muctieu=$idMucTieu',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) return [];

    List<dynamic> list = jsonDecode(response.body);

    List<ChiTietNgayTietKiem> dsNgay = [];
    for (var item in list) {
      ChiTietNgayTietKiem ngay = ChiTietNgayTietKiem.fromJson(item);
      dsNgay.add(ngay);
    }

    return dsNgay;
  }

  Future<bool> themMucTieuTietKiem(
      {int idNguoiDung,
      String tenMucTieu,
      String moTa,
      int soTienTietKiem,
      DateTime ngayBD,
      DateTime ngayKT,
      String loaiTietKiem}) async {
    var body = {
      "IdNguoiDung": idNguoiDung,
      "TenMucTieu": tenMucTieu,
      "MoTa": moTa,
      "SoTienTietKiem": soTienTietKiem,
      "NgayBD": ngayBD,
      "NgayKT": ngayKT,
      "LoaiTietKiem": loaiTietKiem,
    };

    var bodyJson = JsonEncoder(myEncode).convert(body);
    http.Response response = await http.post(
      _urlMucTieu,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: bodyJson,
    );

    // print(bodyJson);
    // print(response.statusCode);

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> capNhatTrangThaiMucTieu({int idMucTieu, DateTime date}) async {
    var body = {
      "date": date,
    };

    var bodyJson = JsonEncoder(myEncode).convert(body);
    http.Response response = await http.put(
      _urlMucTieu + '/' + idMucTieu.toString(),
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
