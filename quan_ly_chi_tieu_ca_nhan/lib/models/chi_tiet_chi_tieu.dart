class ChiTietChiTieu {
  int id;
  int chiTieuId;
  String ten;
  String nhom;
  int soTien;
  DateTime createdAt;

  ChiTietChiTieu({
    this.id = 0,
    this.chiTieuId = 0,
    this.ten = '',
    this.nhom = '',
    this.soTien = 0,
    DateTime createdAt,
  }) : this.createdAt = createdAt ?? DateTime.now();

  factory ChiTietChiTieu.fromJson(Map<String, dynamic> json) {
    return ChiTietChiTieu(
      id: json['id'],
      chiTieuId: json['chiTieuId'],
      ten: json['ten'].toString(),
      nhom: json['nhom'].toString(),
      soTien: json['soTien'],
      createdAt: DateTime.parse(json['createdAt'].toString()),
    );
  }
}
