import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/constants.dart';

class AddIncomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: ListView(
            children: [
              Text(
                'Nhập số tiền cần quản lý:',
                style: kTitleTextStyle,
              ),
              SizedBox(height: 10.0),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Nhập số tiền cần quản lý',
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nhóm thu nhập',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        letterSpacing: 1.3,
                      ),
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
                                    Text('Ba mẹ'),
                                  ],
                                ),
                                Radio(
                                  value: false,
                                  groupValue: null,
                                  onChanged: (value) {},
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
                                    Text('Học bổng'),
                                  ],
                                ),
                                Radio(
                                  value: false,
                                  groupValue: null,
                                  onChanged: (value) {},
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
                                    Text('Công việc'),
                                  ],
                                ),
                                Radio(
                                  value: false,
                                  groupValue: null,
                                  onChanged: (value) {},
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
                                    Text('Khác'),
                                  ],
                                ),
                                Radio(
                                  value: false,
                                  groupValue: null,
                                  onChanged: (value) {},
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
              SizedBox(height: 15),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Ngày bắt đầu:',
                            style: kTitleTextStyle,
                          ),
                          SizedBox(height: 10.0),
                          TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.datetime,
                            decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Ngày bắt đầu'),
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
                          SizedBox(height: 10.0),
                          TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.datetime,
                            decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Ngày kết thúc',
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  elevation: 5.0,
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Thêm quản lý thu nhập mới',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
