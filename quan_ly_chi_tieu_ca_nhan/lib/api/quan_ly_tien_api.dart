import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quan_ly_chi_tieu_ca_nhan/models/list_quan_ly_tien.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/constants.dart';

class QuanLyTienApi {
  final String _url = "$kURL/api/quanlytien";

  Future<List<ListQuanLyTien>> getAllQuanLyTien(int userID) async {
    http.Response response = await http.get(
      '$_url?user_id=$userID',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) return [];

    List<dynamic> list = jsonDecode(response.body);

    List<ListQuanLyTien> dsQuanLyTien = [];
    for (var json in list) {
      ListQuanLyTien quanLyTien = ListQuanLyTien.fromJson(json);
      dsQuanLyTien.add(quanLyTien);
    }

    return dsQuanLyTien;
  }
}
