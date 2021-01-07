import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/api/quan_ly_tien_api.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/nut_bam.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/constants.dart';

class ThemQuanLyTienPage extends StatefulWidget {
  final int idNguoiDung;
  ThemQuanLyTienPage({this.idNguoiDung});

  @override
  _ThemQuanLyTienPageState createState() => _ThemQuanLyTienPageState();
}

class _ThemQuanLyTienPageState extends State<ThemQuanLyTienPage> {
  String ngayBD;
  String ngayKT;
  QuanLyTienApi quanLyTienApi = QuanLyTienApi();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10.0),
            Text(
              'Tạo mới 1 kế hoạch quản lý tiền',
              style: kTitleTextStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50.0),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Ngày bắt đầu:',
                        textAlign: TextAlign.left,
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
                          ngayBD = value;
                        },
                        validator: (val) {
                          print(val);
                          return null;
                        },
                        onSaved: (value) {
                          ngayBD = value;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Ngày kết thúc:',
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
                          ngayKT = value;
                        },
                        validator: (val) {
                          print(val);
                          return null;
                        },
                        onSaved: (value) {
                          ngayKT = value;
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 30.0),
            NutBam(
              textName: 'Tạo',
              onPressed: () async {
                bool ketQua = await quanLyTienApi.themQuanLyTien(
                  idNguoiDung: widget.idNguoiDung,
                  ngayBD: DateTime.parse(ngayBD),
                  ngayKT: DateTime.parse(ngayKT),
                );

                if (ketQua == true)
                  Navigator.pop(context);
                else
                  print("lỗi");
              },
            ),
          ],
        ),
      ),
    );
  }
}
