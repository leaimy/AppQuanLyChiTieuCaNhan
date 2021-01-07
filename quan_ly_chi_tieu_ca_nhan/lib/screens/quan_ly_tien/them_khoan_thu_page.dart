import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/api/quan_ly_tien_api.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/nut_bam.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/constants.dart';

class ThemKhoanThuPage extends StatefulWidget {
  final int idQuanLyTien;
  final Function onSuccess;

  ThemKhoanThuPage({this.idQuanLyTien, this.onSuccess});

  @override
  _ThemKhoanThuPageState createState() => _ThemKhoanThuPageState();
}

class _ThemKhoanThuPageState extends State<ThemKhoanThuPage> {
  int soTien = 0;
  String nguonThu = "Gia đình";

  QuanLyTienApi quanLyTienApi = QuanLyTienApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm nguồn thu'),
      ),
      body: SafeArea(
        child: Container(
          padding: kPaddingMainPage,
          color: Colors.white,
          child: ListView(
            children: [
              Text(
                'Nhập số tiền:',
                style: kTitleTextStyle,
              ),
              SizedBox(height: 10.0),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Nhập số tiền',
                ),
                onChanged: (value) {
                  soTien = int.parse(value);
                },
              ),
              SizedBox(height: 30.0),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chọn nguồn thu:',
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
                                      'Gia đình',
                                      style: kNguonThuItemStyle,
                                    ),
                                  ],
                                ),
                                Radio(
                                  value: "Gia đình",
                                  groupValue: nguonThu,
                                  onChanged: (value) {
                                    setState(() {
                                      nguonThu = value;
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
                                      'Học bổng',
                                      style: kNguonThuItemStyle,
                                    ),
                                  ],
                                ),
                                Radio(
                                  value: "Học bổng",
                                  groupValue: nguonThu,
                                  onChanged: (value) {
                                    setState(() {
                                      nguonThu = value;
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
                                      'Công việc',
                                      style: kNguonThuItemStyle,
                                    ),
                                  ],
                                ),
                                Radio(
                                  value: "Công việc",
                                  groupValue: nguonThu,
                                  onChanged: (value) {
                                    setState(() {
                                      nguonThu = value;
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
                                      'Khác',
                                      style: kNguonThuItemStyle,
                                    ),
                                  ],
                                ),
                                Radio(
                                  value: "Khác",
                                  groupValue: nguonThu,
                                  onChanged: (value) {
                                    setState(() {
                                      nguonThu = value;
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
              NutBam(
                textName: 'Thêm',
                onPressed: () async {
                  bool ketQua = await quanLyTienApi.themNguonThu(
                    idQuanLyTien: widget.idQuanLyTien,
                    soTien: soTien,
                    nhom: nguonThu,
                  );

                  if (ketQua == true) {
                    if (widget.onSuccess != null) widget.onSuccess();
                    Navigator.pop(context);
                  } else
                    print("lỗi");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
