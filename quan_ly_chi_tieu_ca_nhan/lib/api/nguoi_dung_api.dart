import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quan_ly_chi_tieu_ca_nhan/models/nguoi_dung.dart';

class NguoiDungApi {
  final String _urlDangNhap = "http://10.0.2.2:5000/api/dangnhap";
  final String _urlTaoTaiKhoan = 'http://10.0.2.2:5000/api/taotaikhoan';

  Future<NguoiDung> dangNhap(String tenDangNhap, String matKhau) async {
    var body = {"TenDangNhap": tenDangNhap, "MatKhau": matKhau};
    var bodyJson = jsonEncode(body);

    final http.Response response = await http.post(
      _urlDangNhap,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: bodyJson,
    );

    if (response.statusCode == 200) {
      return NguoiDung.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Future<NguoiDung> taoTaiKhoan(String tenDangNhap, String matKhau,
      String tenHienThi, String avatar) async {
    var body = {
      "TenDangNhap": tenDangNhap,
      "MatKhau": matKhau,
      "TenHienThi": tenHienThi,
      "Avatar": avatar,
    };

    var bodyJson = jsonEncode(body);

    http.Response response = await http.post(
      _urlTaoTaiKhoan,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: bodyJson,
    );

    if (response.statusCode == 200) {
      return NguoiDung.fromJson(jsonDecode(response.body));
    }

    return null;
  }
}
