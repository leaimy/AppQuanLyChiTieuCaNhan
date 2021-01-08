import 'package:flutter/material.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/api/chi_tieu_api.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/nut_bam.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/constants.dart';

class ThemChiTieuPage extends StatefulWidget {
  final int idNguoiDung;
  final Function onSuccess;

  ThemChiTieuPage({@required this.idNguoiDung, this.onSuccess});

  @override
  _ThemChiTieuPageState createState() => _ThemChiTieuPageState();
}

class _ThemChiTieuPageState extends State<ThemChiTieuPage> {
  String tenChiTieu = "";
  String nhom = "Thức ăn";
  int soTien = 0;

  ChiTieuAPI chiTieuAPI = ChiTieuAPI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm 1 chi tiêu mới'),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: kPaddingMainPage,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tiêu đề:',
                      style: kTitleTextStyle,
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      textAlign: TextAlign.center,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Nhập tiêu đề khoản chi',
                      ),
                      onChanged: (value) {
                        tenChiTieu = value;
                      },
                    )
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nhóm chi tiêu:',
                      style: kTitleTextStyle,
                    ),
                    SizedBox(height: 15.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 1.0, color: Colors.grey),
                          bottom: BorderSide(width: 1.0, color: Colors.grey),
                          left: BorderSide(width: 1.0, color: Colors.grey),
                          right: BorderSide(width: 1.0, color: Colors.grey),
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: EdgeInsets.all(15.0),
                      child: Card(
                        elevation: 0.0,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 30.0,
                                      width: 7.0,
                                      decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      'Thức ăn',
                                      style: kNguonThuItemStyle,
                                    ),
                                  ],
                                ),
                                Radio(
                                  value: "Thức ăn",
                                  groupValue: nhom,
                                  onChanged: (value) {
                                    setState(() {
                                      nhom = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.0,
                              width: double.infinity,
                              child: Container(color: Colors.grey.shade200),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 30.0,
                                      width: 7.0,
                                      decoration: BoxDecoration(
                                        color: Colors.purpleAccent,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      'Bạn bè',
                                      style: kNguonThuItemStyle,
                                    ),
                                  ],
                                ),
                                Radio(
                                  value: "Bạn bè",
                                  groupValue: nhom,
                                  onChanged: (value) {
                                    setState(() {
                                      nhom = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.0,
                              width: double.infinity,
                              child: Container(color: Colors.grey.shade200),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 30.0,
                                      width: 7.0,
                                      decoration: BoxDecoration(
                                        color: Colors.pinkAccent,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      'Quần áo',
                                      style: kNguonThuItemStyle,
                                    ),
                                  ],
                                ),
                                Radio(
                                  value: "Quần áo",
                                  groupValue: nhom,
                                  onChanged: (value) {
                                    setState(() {
                                      nhom = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.0,
                              width: double.infinity,
                              child: Container(color: Colors.grey.shade200),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 30.0,
                                      width: 7.0,
                                      decoration: BoxDecoration(
                                        color: Colors.greenAccent,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      'Di chuyển',
                                      style: kNguonThuItemStyle,
                                    ),
                                  ],
                                ),
                                Radio(
                                  value: "Di chuyển",
                                  groupValue: nhom,
                                  onChanged: (value) {
                                    setState(() {
                                      nhom = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.0,
                              width: double.infinity,
                              child: Container(color: Colors.grey.shade200),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 30.0,
                                      width: 7.0,
                                      decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      'Khác',
                                      style: kNguonThuItemStyle,
                                    ),
                                  ],
                                ),
                                Radio(
                                  value: "Khác",
                                  groupValue: nhom,
                                  onChanged: (value) {
                                    setState(() {
                                      nhom = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Số tiền:',
                      style: kTitleTextStyle,
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Nhập số tiền đã chi',
                      ),
                      onChanged: (value) {
                        soTien = int.parse(value);
                      },
                    )
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              NutBam(
                textName: 'Thêm chi tiêu',
                onPressed: () async {
                  bool ketQua = await chiTieuAPI.themChiTieu(
                    tenChiTieu: tenChiTieu,
                    nhom: nhom,
                    soTien: soTien,
                    ngayChiTieu: DateTime.now(),
                    idNguoiDung: widget.idNguoiDung,
                  );
                  if (ketQua == true) {
                    if (widget.onSuccess != null) widget.onSuccess();
                    Navigator.pop(context);
                  } else
                    print("lỗi");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
