class QuanLyTienThongKeChiTiet {
  final int soTienHienCo;
  final int soTienDaSuDung;
  final int soDu;
  final DateTime ngayBD;
  final DateTime ngayKT;
  final int soNgayConLai;
  final int hanMucChiTieu;
  final int soNgayVuotMuc;

  QuanLyTienThongKeChiTiet({
    this.soTienHienCo = 0,
    this.soTienDaSuDung = 0,
    this.soDu = 0,
    DateTime ngayBD,
    DateTime ngayKT,
    this.soNgayConLai = 0,
    this.hanMucChiTieu = 0,
    this.soNgayVuotMuc = 0,
  })  : this.ngayBD = ngayBD ?? DateTime.now(),
        this.ngayKT = ngayKT ?? DateTime.now();

  factory QuanLyTienThongKeChiTiet.fromJson(Map<String, dynamic> json) {
    return QuanLyTienThongKeChiTiet(
      soTienHienCo: int.parse(json['soTienHienCo'].toString()),
      soTienDaSuDung: int.parse(json['soTienDaSuDung'].toString()),
      soDu: int.parse(json['soDu'].toString()),
      ngayBD: DateTime.parse(json['ngayBD']),
      ngayKT: DateTime.parse(json['ngayKT']),
      soNgayConLai: int.parse(json['soNgayConLai'].toString()),
      hanMucChiTieu: int.parse(json['hanMucChiTieu'].toString()),
      soNgayVuotMuc: int.parse(json['soNgayVuotMuc'].toString()),
    );
  }
}
