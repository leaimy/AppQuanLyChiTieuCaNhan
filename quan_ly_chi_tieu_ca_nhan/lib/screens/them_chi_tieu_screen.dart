import 'package:flutter/material.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/constants.dart';

class AddOutcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
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
                        hintText: 'Nhập tiêu đề khoản chi tiêu',
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
                      'Nhóm chi tiêu',
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
                                    Text('Học tập'),
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
                                    Text('Xã hội'),
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
                                    Text('Thực phẩm'),
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
              SizedBox(height: 30.0),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Số tiền:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        letterSpacing: 1.3,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Nhập số tiền đã chi',
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
                    onPressed: () {},
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Thêm chi tiêu mới',
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