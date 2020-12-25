import 'package:flutter/material.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/nguoi_dung/sign_in_page.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/nguoi_dung/sign_up_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            left: 50.0,
            right: 50.0,
            top: 50.0,
          ),
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
              SizedBox(
                height: 300.0,
                width: double.infinity,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  elevation: 5.0,
                  color: Colors.pink[200],
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SignUpPage();
                      }));
                    },
                    minWidth: 150.0,
                    height: 42.0,
                    child: Text(
                      'Tạo tài khoản',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lobster',
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
                width: double.infinity,
              ),
              Material(
                elevation: 5.0,
                color: Colors.pink[200],
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SignInPage();
                    }));
                  },
                  minWidth: 150.0,
                  height: 42.0,
                  child: Text(
                    'Đăng nhập',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lobster',
                      fontSize: 17.0,
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