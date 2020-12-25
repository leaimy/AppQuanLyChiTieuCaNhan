import 'package:flutter/material.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/nut_bam.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/nguoi_dung/sign_in_page.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/nguoi_dung/sign_up_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Text(
                'Quản Lý Chi Tiêu',
                style: TextStyle(
                  fontFamily: 'Lobster',
                  fontSize: 25.0,
                  color: Colors.pink[200],
                ),
              ),
              Expanded(child: Container()),
              Container(
                width: 200.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    NutBam(
                      textName: 'Đăng nhập',
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignInPage();
                        }));
                      },
                    ),
                    NutBam(
                      textName: 'Tạo tài khoản',
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignUpPage();
                        }));
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
