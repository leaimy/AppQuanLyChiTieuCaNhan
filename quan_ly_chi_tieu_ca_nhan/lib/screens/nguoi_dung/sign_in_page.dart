import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/api/nguoi_dung_api.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/nut_bam.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/nguoi_dung.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/home_page.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/services/snackbar_service.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String tenDangNhap = "";
  String matKhau = "";

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
                          Text(
                            'Mời bạn đăng nhập',
                            style: TextStyle(
                              fontFamily: 'Lobster',
                              fontSize: 22.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 15.0),
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
                                    keyboardType: TextInputType.emailAddress,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      icon: Icon(
                                        FontAwesomeIcons.solidUser,
                                        color: Colors.blue[400],
                                      ),
                                      hintText: 'Heocon',
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
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    obscureText: true,
                                    obscuringCharacter: '*',
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
                                textName: 'Đăng nhập',
                                onPressed: () async {
                                  String errorMessage = "";
                                  if (tenDangNhap.length == 0) {
                                    errorMessage +=
                                        "Vui lòng điền tên đăng nhập hợp lệ\n";
                                  }

                                  if (matKhau.length == 0)
                                    errorMessage +=
                                        "Vui lòng điền mật khẩu hợp lệ\n";

                                  if (errorMessage.length > 0) {
                                    SnackBarSv.instance
                                        .showSnackbarError(errorMessage);
                                    return;
                                  }

                                  NguoiDungApi api = NguoiDungApi();
                                  NguoiDung nguoiDung =
                                      await api.dangNhap(tenDangNhap, matKhau);
                                  if (nguoiDung == null) {
                                    SnackBarSv.instance.showSnackbarError(
                                        "Thông tin tài khoản không đúng");
                                  } else {
                                    print(nguoiDung.tenDangNhap);
                                    print(nguoiDung.avatar);
                                    print(nguoiDung.matKhau);
                                    print(nguoiDung.id);
                                    print(nguoiDung.tenHienThi);
                                    print(nguoiDung.createdAt);

                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return HomePage(
                                        nguoiDung: nguoiDung,
                                      );
                                    }));
                                  }
                                },
                              ),
                              SizedBox(height: 30.0, width: double.infinity),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.facebook,
                                    color: Colors.blue[600],
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Icon(
                                    FontAwesomeIcons.google,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Icon(
                                    FontAwesomeIcons.twitter,
                                    color: Colors.blue[300],
                                  ),
                                ],
                              ),
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
