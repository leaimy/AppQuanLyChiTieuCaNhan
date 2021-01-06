class ChiTietMucTieu {
  int id;
  int idNguoiDung;
  String tenMucTieu;
  String moTa;
  int soTienTietKiem;
  int soTienDaTietKiem;
  DateTime ngayBD;
  DateTime ngayKT;
  bool trangThai;
  String loaiTietKiem;
  int soNgayHoanThanh;
  int soNgayChuaHoanThanh;

  ChiTietMucTieu({
    this.id = 0,
    this.idNguoiDung = 0,
    this.tenMucTieu = "",
    this.moTa = "",
    this.soTienTietKiem = 0,
    this.soTienDaTietKiem = 0,
    DateTime ngayBD,
    DateTime ngayKT,
    this.trangThai = false,
    this.loaiTietKiem = "ngày",
    this.soNgayHoanThanh = 0,
    this.soNgayChuaHoanThanh = 0,
  })  : this.ngayBD = ngayBD ?? DateTime.now(),
        this.ngayKT = ngayKT ?? DateTime.now();

  factory ChiTietMucTieu.fromJson(Map<String, dynamic> json) {
    return ChiTietMucTieu(
      id: json['id'],
      idNguoiDung: json['idNguoiDung'],
      tenMucTieu: json['tenMucTieu'],
      moTa: json['moTa'],
      soTienTietKiem: json['soTienTietKiem'],
      soTienDaTietKiem: json['soTienDaTietKiem'],
      ngayBD: DateTime.parse(json['ngayBD'].toString()),
      ngayKT: DateTime.parse(json['ngayKT'].toString()),
      trangThai: json['trangThai'],
      loaiTietKiem: json['loaiTietKiem'],
      soNgayHoanThanh: json['soNgayHoanThanh'],
      soNgayChuaHoanThanh: json['soNgayChuaHoanThanh'],
    );
  }
}
