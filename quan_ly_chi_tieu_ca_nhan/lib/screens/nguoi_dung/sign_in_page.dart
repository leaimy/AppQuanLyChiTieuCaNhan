import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/nut_bam.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/home_page.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                                  'Email:',
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
                                    hintText: 'Heo con',
                                    hintStyle: TextStyle(
                                      fontFamily: 'Lobster',
                                    ),
                                  ),
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
                                ),
                              ],
                            ),
                            SizedBox(height: 20.0, width: double.infinity),
                            NutBam(
                              textName: 'Đăng nhập',
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return HomePage();
                                }));
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
      ),
    );
  }
}
