import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quan_ly_chi_tieu_ca_nhan/models/list_muc_tieu.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/constants.dart';

class MucTieuApi {
  String _urlMucTieu = "$kURL/api/tietkiem?user_id=";

  Future<List<MucTieuTietKiem>> getAllMucTieu(int idNguoiDung) async {
    _urlMucTieu = '$_urlMucTieu$idNguoiDung';

    final http.Response response = await http.get(
      _urlMucTieu,
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
}
