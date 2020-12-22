import 'package:flutter/material.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/constants.dart';

class ThemMucTieuScreen extends StatelessWidget {
  const ThemMucTieuScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                  Text('Ngày'),
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
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                                  Text('Tuần'),
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
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Ngày bắt đầu',
                        style: kTitleTextStyle,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 40.0,
                        width: 150.0,
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: "Nhập ngày bắt đầu",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Ngày kết thúc',
                        style: kTitleTextStyle,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 40.0,
                        width: 150.0,
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: "Nhập ngày kết thúc",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
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
              textAlign: TextAlign.center,
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Nhập số tiền',
              ),
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
            ),
            SizedBox(height: 5.0),
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
                    'Xác nhận thêm',
                    style: TextStyle(
                      fontFamily: 'Lobster',
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Bỏ heo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Chi tiêu',
          ),
        ],
        //currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        //onTap: _onItemTapped,
      ),
    );
  }
}
