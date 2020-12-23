import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            // left: 50.0,
            // right: 50.0,
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
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30.0,
                width: double.infinity,
              ),
              Opacity(
                opacity: 0.8,
                child: Material(
                  elevation: 10.0,
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    height: 450.0,
                    width: 350.0,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                flex: 6,
                                child: Text(
                                  'Tạo tài khoản mới',
                                  style: TextStyle(
                                    fontFamily: 'Lobster',
                                    fontSize: 22.0,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Material(
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
                              ),
                            ],
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      fontFamily: 'Lobster'),
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
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Tên người dùng:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      fontFamily: 'Lobster'),
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
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Mật khẩu:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      fontFamily: 'Lobster'),
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
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 85.0, top: 20.0),
                                  child: Material(
                                    elevation: 5.0,
                                    color: Colors.pink[200],
                                    borderRadius: BorderRadius.circular(30.0),
                                    child: MaterialButton(
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return LoginScreen();
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
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
