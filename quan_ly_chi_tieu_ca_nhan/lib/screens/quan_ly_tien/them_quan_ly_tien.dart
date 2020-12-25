import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/nut_bam.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/constants.dart';

class ThemQuanLyTienPage extends StatelessWidget {
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
                        onChanged: (val) => print(val),
                        validator: (val) {
                          print(val);
                          return null;
                        },
                        onSaved: (val) => print(val),
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
                        onChanged: (val) => print(val),
                        validator: (val) {
                          print(val);
                          return null;
                        },
                        onSaved: (val) => print(val),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 30.0),
            NutBam(
              textName: 'Tạo',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
