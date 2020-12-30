class NguoiDung {
  int id;
  String tenDangNhap;
  String matKhau;
  String tenHienThi;
  String avatar;
  DateTime createdAt;

  NguoiDung(
      {this.id,
      this.tenDangNhap,
      this.matKhau,
      this.tenHienThi,
      this.avatar,
      this.createdAt});

  factory NguoiDung.fromJson(Map<String, dynamic> json) {
    return NguoiDung(
        id: json['id'],
        tenDangNhap: json['tenDangNhap'],
        matKhau: json['matKhau'],
        tenHienThi: json['tenHienThi'],
        avatar: json['avatar'],
        createdAt: DateTime.parse(json['createdAt']));
  }
}
