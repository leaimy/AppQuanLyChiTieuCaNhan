class ThongKeTietKiem {
  int idNguoiDung;
  int tongTienTietKiem;
  int tongTienDaTietKiem;
  int soMTHoanThanh;
  int soMTChuaHoanThanh;

  ThongKeTietKiem({
    this.idNguoiDung = 0,
    this.tongTienTietKiem = 0,
    this.tongTienDaTietKiem = 0,
    this.soMTHoanThanh = 0,
    this.soMTChuaHoanThanh = 0,
  });

  factory ThongKeTietKiem.fromJson(Map<String, dynamic> json) {
    print(json);
    return ThongKeTietKiem(
      idNguoiDung: int.parse(json['idNguoiDung'].toString()),
      tongTienTietKiem: int.parse(json['tongTienTietKiem'].toString()),
      tongTienDaTietKiem: int.parse(json['tongTienDaTietKiem'].toString()),
      soMTHoanThanh: int.parse(json['soMTHoanThanh'].toString()),
      soMTChuaHoanThanh: int.parse(json['soMTChuaHoanThanh'].toString()),
    );
  }
}
