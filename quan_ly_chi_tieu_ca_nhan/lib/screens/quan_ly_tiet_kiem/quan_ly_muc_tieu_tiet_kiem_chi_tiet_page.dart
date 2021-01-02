import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/card_chi_tiet_tiet_kiem.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/card_muc_tieu_item.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/circle_date_box.dart';

var ngayBD = new DateTime(2020, 10, 20);
var ngayKT = new DateTime(2020, 12, 25);

class QuanLyMucTieuTietKiemChiTietPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(
              FontAwesomeIcons.solidBell,
              color: Colors.yellow,
            ),
          )
        ],
        title: Text(
          'Bỏ heo mua sách',
          style: TextStyle(
            fontFamily: 'Lobster',
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: ListView(
            children: [
              Container(
                height: 230,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CardChiTietTietKiem(
                      title: 'Tên mục tiêu',
                      money: 'Tiết kiệm mua máy ảnh',
                      icon: Icons.ac_unit,
                    ),
                    CardChiTietTietKiem(
                      title: 'Tên mục tiêu',
                      money:
                          'Mua 1 chiếc máy ảnh thật đẹp để chụp hình cho mọi người 😘😘😘',
                      icon: Icons.ac_unit,
                    ),
                    CardChiTietTietKiem(
                      title: 'Ngày bắt đầu',
                      money: '20-10-2020',
                      icon: Icons.ac_unit,
                    ),
                    CardChiTietTietKiem(
                      title: 'Ngày kết thúc',
                      money: '20-12-2020',
                      icon: Icons.ac_unit,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Material(
                          elevation: 5.0,
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(30.0),
                          child: Container(
                            width: 100.0,
                            height: 42.0,
                            child: MaterialButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                children: [
                                  Text(
                                    'Check',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                                  Icon(
                                    FontAwesomeIcons.check,
                                    color: Colors.lightGreen,
                                    size: 16.0,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      CalendarCarousel(
                        weekendTextStyle: TextStyle(
                          color: Colors.red,
                        ),
                        todayBorderColor: Colors.transparent,
                        todayButtonColor: Colors.transparent,
                        thisMonthDayBorderColor: Colors.transparent,
                        weekFormat: false,
                        // markedDatesMap: _markedDateMap,
                        height: 360.0,
                        // selectedDateTime: _currentDate,
                        daysHaveCircularBorder: true,
                        customDayBuilder: (
                          /// you can provide your own build function to make custom day containers
                          bool isSelectable,
                          int index,
                          bool isSelectedDay,
                          bool isToday,
                          bool isPrevMonthDay,
                          TextStyle textStyle,
                          bool isNextMonthDay,
                          bool isThisMonthDay,
                          DateTime now,
                        ) {
                          // print(now);
                          if (isToday) {
                            return CircleDateBox(
                              text: now.day.toString(),
                              color: Colors.green,
                            );
                          }
                          if (ngayBD.year <= now.year &&
                              now.year <= ngayKT.year) {
                            if (ngayBD.month <= now.month &&
                                now.month <= ngayKT.month) {
                              if (now.month == ngayKT.month &&
                                  now.day > ngayKT.day) return null;
                              if (now.month == ngayBD.month &&
                                  now.day < ngayBD.day) return null;

                              return CircleDateBox(
                                text: now.day.toString(),
                                color: Colors.pink[100],
                              );
                            } else
                              return null;
                          } else
                            return null;
                        },
                      ),
                    ],
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
