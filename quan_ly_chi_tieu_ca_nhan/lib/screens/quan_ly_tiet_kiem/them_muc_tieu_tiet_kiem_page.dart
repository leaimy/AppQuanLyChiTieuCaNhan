import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/api/quan_ly_tiet_kiem_api.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/nut_bam.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/constants.dart';

class ThemMucTieuTietKiemPage extends StatefulWidget {
  final int idNguoiDung;
  final Function onSuccess;

  ThemMucTieuTietKiemPage({this.idNguoiDung, this.onSuccess});
  @override
  _ThemMucTieuTietKiemPageState createState() =>
      _ThemMucTieuTietKiemPageState();
}

class _ThemMucTieuTietKiemPageState extends State<ThemMucTieuTietKiemPage> {
  String tenMucTieu = "";
  String loaiTietKiem = "Ngày";
  DateTime ngayBD = DateTime.now();
  DateTime ngayKT = DateTime.now().add(Duration(days: 30));
  int soTien = 0;
  String moTa = "";

  MucTieuApi mucTieuApi = MucTieuApi();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thêm mục tiêu tiết kiệm',
          style: TextStyle(
            fontFamily: 'Lobster',
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tên mục tiêu:',
                    style: kTitleTextStyle,
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Nhập tên mục tiêu',
                    ),
                    onChanged: (value) {
                      tenMucTieu = value;
                    },
                  )
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Loại tiết kiệm',
                    style: kTitleTextStyle,
                  ),
                  SizedBox(height: 10.0),
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
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'Ngày',
                                    style: TextStyle(
                                      fontFamily: 'Lobster',
                                      fontSize: 18.0,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                              Radio(
                                value: "Ngày",
                                groupValue: loaiTietKiem,
                                onChanged: (value) {
                                  setState(() {
                                    loaiTietKiem = value;
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
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'Tuần',
                                    style: TextStyle(
                                      fontFamily: 'Lobster',
                                      fontSize: 18.0,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                              Radio(
                                value: "Tuần",
                                groupValue: loaiTietKiem,
                                onChanged: (value) {
                                  setState(() {
                                    loaiTietKiem = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Ngày bắt đầu',
                          style: kTitleTextStyle,
                        ),
                        DateTimePicker(
                          textAlign: TextAlign.center,
                          dateMask: 'dd/MM/yyyy',
                          type: DateTimePickerType.date,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          initialValue: DateTime.now().toString(),
                          onChanged: (value) {
                            ngayBD = DateTime.parse(value);
                          },
                          validator: (val) {
                            print(val);
                            return null;
                          },
                          onSaved: (value) {
                            ngayBD = DateTime.parse(value);
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Ngày kết thúc',
                          style: kTitleTextStyle,
                        ),
                        DateTimePicker(
                          textAlign: TextAlign.center,
                          dateMask: 'dd/MM/yyyy',
                          type: DateTimePickerType.date,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          initialValue:
                              DateTime.now().add(Duration(days: 1)).toString(),
                          onChanged: (value) {
                            ngayKT = DateTime.parse(value);
                          },
                          validator: (val) {
                            print(val);
                            return null;
                          },
                          onSaved: (value) {
                            ngayKT = DateTime.parse(value);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Số tiền cần tiết kiệm:',
              style: kTitleTextStyle,
            ),
            SizedBox(height: 10.0),
            TextField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Nhập số tiền',
              ),
              onChanged: (value) {
                soTien = int.parse(value);
              },
            ),
            SizedBox(height: 10.0),
            Text(
              'Mô tả mục tiêu:',
              style: kTitleTextStyle,
            ),
            SizedBox(height: 10.0),
            TextField(
              textAlign: TextAlign.center,
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Nhập mô tả',
              ),
              onChanged: (value) {
                moTa = value;
              },
            ),
            SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: NutBam(
                textName: 'Xác nhận thêm',
                onPressed: () async {
                  bool ketQua = await mucTieuApi.themMucTieuTietKiem(
                    idNguoiDung: widget.idNguoiDung,
                    tenMucTieu: tenMucTieu,
                    moTa: moTa,
                    soTienTietKiem: soTien,
                    ngayBD: ngayBD,
                    ngayKT: ngayKT,
                    loaiTietKiem: loaiTietKiem,
                  );

                  if (ketQua == true) {
                    if (widget.onSuccess != null) widget.onSuccess();
                    Navigator.pop(context);
                  } else
                    print('Lỗi');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
