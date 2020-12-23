import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/card_muc_tieu_item.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/rounded_icon_box.dart';

var ngayBD = new DateTime(2020, 10, 20);
var ngayKT = new DateTime(2020, 12, 25);

class ChiTietMucTieuTietKiemScreen extends StatelessWidget {
  const ChiTietMucTieuTietKiemScreen({
    Key key,
  }) : super(key: key);

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
              Card(
                elevation: 10.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardMucTieuItem(
                      nameLable: 'Tên mục tiêu:',
                      nameText: 'Bỏ heo mua sách',
                      colorLable: Colors.pink[300],
                      colorText: Colors.blue,
                    ),
                    CardMucTieuItem(
                      nameLable: 'Loại tiết kiệm:',
                      nameText: 'Ngày',
                      colorLable: Colors.grey[600],
                      colorText: Colors.yellow[600],
                    ),
                    CardMucTieuItem(
                      nameLable: 'Ngày bắt đầu:',
                      nameText: '20/10/2020',
                      colorLable: Colors.green[400],
                      colorText: Colors.red,
                    ),
                    CardMucTieuItem(
                      nameLable: 'Ngày kết thúc:',
                      nameText: '20/12/2020',
                      colorLable: Colors.purple[300],
                      colorText: Colors.red[300],
                    ),
                    CardMucTieuItem(
                      nameLable: 'Số tiền cần tiết kiệm:',
                      nameText: '500.000 VND',
                      colorLable: Colors.orange[500],
                      colorText: Colors.blue[800],
                    ),
                    CardMucTieuItem(
                      nameLable: 'Mô tả:',
                      nameText: 'Cố lên!!',
                      colorLable: Colors.pinkAccent[400],
                      colorText: Colors.purpleAccent,
                    ),
                    CardMucTieuItem(
                      nameLable: 'Số ngày đã hoàn thành:',
                      nameText: '60',
                      colorLable: Colors.greenAccent,
                      colorText: Colors.red[400],
                    ),
                    CardMucTieuItem(
                      nameLable: 'Số ngày chưa hoàn thành:',
                      nameText: '30',
                      colorLable: Colors.blueGrey,
                      colorText: Colors.pink[200],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                            return RoundedIconBox(
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

                              return RoundedIconBox(
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
