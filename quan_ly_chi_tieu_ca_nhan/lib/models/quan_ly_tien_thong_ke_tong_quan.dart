class QuanLyTienThongKeTongQuan {
  int tongSoTienDaQuanLy;
  int tongSoTienDaChiTieu;
  int tongSoKeHoachQuanLyDaHoanThanh;

  QuanLyTienThongKeTongQuan({
    this.tongSoTienDaQuanLy = 0,
    this.tongSoTienDaChiTieu = 0,
    this.tongSoKeHoachQuanLyDaHoanThanh = 0,
  });

  factory QuanLyTienThongKeTongQuan.fromJson(Map<String, dynamic> json) {
    print(json);
    return QuanLyTienThongKeTongQuan(
      tongSoTienDaQuanLy: int.parse(json['tongSoTienDaQuanLy'].toString()),
      tongSoTienDaChiTieu: int.parse(json['tongSoTienDaChiTieu'].toString()),
      tongSoKeHoachQuanLyDaHoanThanh:
          int.parse(json['tongSoKeHoachQuanLyDaHoanThanh'].toString()),
    );
  }
}
