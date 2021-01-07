import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/api/nguoi_dung_api.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/nut_bam.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/nguoi_dung.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/welcome_page.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/services/snackbar_service.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String tenDangNhap = "";
  String tenHienThi = "";
  String matKhau = "";
  String avatar;

  @override
  void initState() {
    int rand = Random().nextInt(10);
    avatar = 'avatar$rand';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (_context) {
        SnackBarSv.instance.buildContext = _context;

        return SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView(
              children: [
                SizedBox(height: 50.0, width: double.infinity),
                Text(
                  'Quản Lý Chi Tiêu',
                  style: TextStyle(
                    fontFamily: 'Lobster',
                    fontSize: 25.0,
                    color: Colors.pink[200],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50.0, width: double.infinity),
                Opacity(
                  opacity: 0.8,
                  child: Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(30.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 30.0,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Tạo tài khoản mới',
                                style: TextStyle(
                                  fontFamily: 'Lobster',
                                  fontSize: 22.0,
                                ),
                              ),
                              Material(
                                elevation: 10.0,
                                shape: CircleBorder(),
                                child: Container(
                                  height: 100.0,
                                  width: 100.0,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage:
                                        AssetImage('images/$avatar.png'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.0, width: double.infinity),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tên đăng nhập:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      fontFamily: 'Lobster',
                                    ),
                                  ),
                                  TextField(
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      icon: Icon(
                                        FontAwesomeIcons.solidEnvelope,
                                        color: Colors.purple[400],
                                      ),
                                      hintText: 'thiha',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Lobster',
                                      ),
                                    ),
                                    onChanged: (value) {
                                      tenDangNhap = value;
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 15.0, width: double.infinity),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tên hiển thị:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      fontFamily: 'Lobster',
                                    ),
                                  ),
                                  TextField(
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      icon: Icon(
                                        FontAwesomeIcons.solidUser,
                                        color: Colors.blue[400],
                                      ),
                                      hintText: 'Heo con',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Lobster',
                                      ),
                                    ),
                                    onChanged: (value) {
                                      tenHienThi = value;
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 15.0, width: double.infinity),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mật khẩu:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      fontFamily: 'Lobster',
                                    ),
                                  ),
                                  TextField(
                                    keyboardType: TextInputType.visiblePassword,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      icon: Icon(
                                        FontAwesomeIcons.key,
                                        color: Colors.orange[400],
                                      ),
                                      hintText: 'nguyenthiha',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Lobster',
                                      ),
                                    ),
                                    onChanged: (value) {
                                      matKhau = value;
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.0, width: double.infinity),
                              NutBam(
                                textName: 'Tạo tài khoản',
                                onPressed: () async {
                                  String errorMessage = "";

                                  if (tenDangNhap.length == 0)
                                    errorMessage +=
                                        "Tên đăng nhập không được để trống\n";
                                  if (tenHienThi.length == 0)
                                    errorMessage +=
                                        "Tên hiển thị không được để trống\n";
                                  if (matKhau.length == 0)
                                    errorMessage +=
                                        "Mật khẩu không được để trống\n";

                                  if (errorMessage.length > 0) {
                                    SnackBarSv.instance
                                        .showSnackbarError(errorMessage);
                                    return;
                                  }

                                  NguoiDungApi api = NguoiDungApi();
                                  NguoiDung nguoiDungMoi =
                                      await api.taoTaiKhoan(tenDangNhap,
                                          matKhau, tenHienThi, avatar);

                                  if (nguoiDungMoi == null) {
                                    SnackBarSv.instance.showSnackbarError(
                                        "Có lỗi trong quá trình tạo mới người dùng! Thử lại sau");
                                    return;
                                  }

                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return WelcomePage();
                                  }));
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0, width: double.infinity),
              ],
            ),
          ),
        );
      }),
    );
  }
}
