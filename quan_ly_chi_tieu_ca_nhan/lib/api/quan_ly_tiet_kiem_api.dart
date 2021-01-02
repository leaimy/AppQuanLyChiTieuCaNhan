import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quan_ly_chi_tieu_ca_nhan/models/list_muc_tieu.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/thong_ke_tiet_kiem.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/constants.dart';

class MucTieuApi {
  final String _urlMucTieu = "$kURL/api/tietkiem";
  final String _urlThongKe = "$kURL/api/tietkiem/thongketietkiem";

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
}
