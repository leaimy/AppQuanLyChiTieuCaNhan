class ChiTietNgayTietKiem {
  int id;
  int idMucTieu;
  bool trangThai;
  int soTien;
  DateTime ngayTietKiem;

  ChiTietNgayTietKiem(
      {this.id,
      this.idMucTieu,
      this.trangThai,
      this.soTien,
      this.ngayTietKiem});

  factory ChiTietNgayTietKiem.fromJson(Map<String, dynamic> json) {
    return ChiTietNgayTietKiem(
      id: json['id'],
      idMucTieu: json['idMucTieu'],
      trangThai: json['trangThai'],
      soTien: json['soTien'],
      ngayTietKiem: DateTime.parse(json['ngayTietKiem']),
    );
  }
}
