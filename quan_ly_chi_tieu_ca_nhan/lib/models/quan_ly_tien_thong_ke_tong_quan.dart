import 'dart:convert';

class QuanLyTienThongKeTongQuan {
  double tongSoTienDaQuanLy;
  double tongSoTienDaChiTieu;
  int tongSoKeHoachQuanLyDaHoanThanh;

  QuanLyTienThongKeTongQuan({
    this.tongSoTienDaQuanLy = 0,
    this.tongSoTienDaChiTieu = 0,
    this.tongSoKeHoachQuanLyDaHoanThanh = 0,
  });

  factory QuanLyTienThongKeTongQuan.fromJson(Map<String, dynamic> json) {
    print(json);
    return QuanLyTienThongKeTongQuan(
      tongSoTienDaQuanLy: double.parse(json['tongSoTienDaQuanLy'].toString()),
      tongSoTienDaChiTieu: double.parse(json['tongSoTienDaChiTieu'].toString()),
      tongSoKeHoachQuanLyDaHoanThanh:
          int.parse(json['tongSoKeHoachQuanLyDaHoanThanh'].toString()),
    );
  }
}
