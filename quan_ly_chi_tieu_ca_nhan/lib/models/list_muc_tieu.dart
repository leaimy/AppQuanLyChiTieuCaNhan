class MucTieuTietKiem {
  int id;
  String tenMucTieu;
  bool trangThai;

  MucTieuTietKiem({this.id, this.tenMucTieu, this.trangThai});

  factory MucTieuTietKiem.fromJson(Map<String, dynamic> json) {
    return MucTieuTietKiem(
        id: json['id'],
        tenMucTieu: json['tenMucTieu'],
        trangThai: json['trangThai']);
  }
}
