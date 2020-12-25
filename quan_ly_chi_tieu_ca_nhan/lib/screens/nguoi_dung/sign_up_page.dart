import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/nut_bam.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/welcome_page.dart';

class SignUpPage extends StatelessWidget {
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
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: Colors.grey[200],
                                ),
                                child: Icon(
                                  FontAwesomeIcons.camera,
                                  color: Colors.pink,
                                  size: 20.0,
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
                                  'Email:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    fontFamily: 'Lobster',
                                  ),
                                ),
                                TextField(
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      FontAwesomeIcons.solidEnvelope,
                                      color: Colors.purple[400],
                                    ),
                                    hintText: '1812751@dlu.edu.vn',
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
                                  'Tên người dùng:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    fontFamily: 'Lobster',
                                  ),
                                ),
                                TextField(
                                  keyboardType: TextInputType.number,
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
                                  keyboardType: TextInputType.number,
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
                              textName: 'Tạo tài khoản',
                              onPressed: () {
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
      ),
    );
  }
}
