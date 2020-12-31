class ListQuanLyTien {
  int id;
  DateTime ngayBD;
  DateTime ngayKT;
  bool trangThai;

  ListQuanLyTien({
    this.id,
    this.ngayBD,
    this.ngayKT,
    this.trangThai,
  });

  factory ListQuanLyTien.fromJson(Map<String, dynamic> json) {
    return ListQuanLyTien(
      id: json['id'],
      ngayBD: DateTime.parse(json['ngayBD']),
      ngayKT: DateTime.parse(json['ngayKT']),
      trangThai: json['trangThai'],
    );
  }
}
