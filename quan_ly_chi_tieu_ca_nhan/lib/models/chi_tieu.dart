class ChiTieu {
  int id;
  int quanLyTienHienCoId;
  int tongChi;
  DateTime ngay;
  bool isSelected;

  ChiTieu({
    this.id = 0,
    this.quanLyTienHienCoId = 0,
    this.tongChi = 0,
    DateTime ngay,
    this.isSelected = false,
  }) : this.ngay = ngay ?? DateTime.now();

  factory ChiTieu.fromJson(Map<String, dynamic> json) {
    return ChiTieu(
      id: json['id'],
      quanLyTienHienCoId: json['quanLyTienHienCoId'],
      tongChi: json['tongChi'],
      ngay: DateTime.parse(json['ngay'].toString()),
    );
  }
}
