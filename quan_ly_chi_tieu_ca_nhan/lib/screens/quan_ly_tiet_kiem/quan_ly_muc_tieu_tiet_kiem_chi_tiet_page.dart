import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/api/quan_ly_tiet_kiem_api.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/card_chi_tiet_tiet_kiem.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/circle_date_box.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/chi_tiet_muc_tieu.dart';

var ngayBD = new DateTime(2020, 10, 20);
var ngayKT = new DateTime(2020, 12, 25);

class QuanLyMucTieuTietKiemChiTietPage extends StatefulWidget {
  final int idMucTieu;
  QuanLyMucTieuTietKiemChiTietPage({this.idMucTieu});
  @override
  _QuanLyMucTieuTietKiemChiTietPageState createState() =>
      _QuanLyMucTieuTietKiemChiTietPageState();
}

class _QuanLyMucTieuTietKiemChiTietPageState
    extends State<QuanLyMucTieuTietKiemChiTietPage> {
  final dateFormat = new DateFormat('dd-MM-yyyy');
  final currencyFormat = NumberFormat('###,###,###,###');
  ChiTietMucTieu chiTietMucTieu = ChiTietMucTieu();
  void getChiTietMucTieu() async {
    MucTieuApi mucTieuApi = MucTieuApi();
    ChiTietMucTieu data = await mucTieuApi.chiTietMucTieu(widget.idMucTieu);
    if (data != null)
      setState(() {
        chiTietMucTieu = data;
      });
  }

  @override
  void initState() {
    getChiTietMucTieu();
    super.initState();
  }

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
          'Chi tiết mục tiêu tiết kiệm',
          style: TextStyle(
            fontFamily: 'Lobster',
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: ListView(
            children: [
              Container(
                height: 230,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CardChiTietTietKiem(
                      tieuDe: 'Tên mục tiêu',
                      giaTri: chiTietMucTieu.tenMucTieu,
                      giaTriColor: Colors.red,
                      icon: FontAwesomeIcons.bullhorn,
                      iconBgColor: Colors.blue[200],
                      iconColor: Colors.orange,
                    ),
                    CardChiTietTietKiem(
                      tieuDe: 'Mô tả',
                      giaTri: chiTietMucTieu.moTa,
                      giaTriColor: Colors.blue,
                      icon: FontAwesomeIcons.heartbeat,
                      iconBgColor: Colors.green[200],
                      iconColor: Colors.red,
                    ),
                    CardChiTietTietKiem(
                      tieuDe: 'Số tiền tiết kiệm',
                      giaTri:
                          '${currencyFormat.format(chiTietMucTieu.soTienTietKiem)}',
                      giaTriColor: Colors.orange,
                      icon: FontAwesomeIcons.moneyBill,
                      iconBgColor: Colors.red[100],
                      iconColor: Colors.green,
                    ),
                    CardChiTietTietKiem(
                      tieuDe: 'Số tiền đã tiết kiệm',
                      giaTri:
                          '${currencyFormat.format(chiTietMucTieu.soTienDaTietKiem)}',
                      giaTriColor: Colors.green,
                      icon: FontAwesomeIcons.handHoldingUsd,
                      iconBgColor: Colors.orange[200],
                      iconColor: Colors.blue,
                    ),
                    CardChiTietTietKiem(
                      tieuDe: 'Ngày bắt đầu',
                      giaTri: '${dateFormat.format(chiTietMucTieu.ngayBD)}',
                      giaTriColor: Colors.pink,
                      icon: FontAwesomeIcons.hourglassStart,
                      iconBgColor: Colors.purple[200],
                      iconColor: Colors.yellow,
                    ),
                    CardChiTietTietKiem(
                      tieuDe: 'Ngày kết thúc',
                      giaTri: '${dateFormat.format(chiTietMucTieu.ngayKT)}',
                      giaTriColor: Colors.teal,
                      icon: FontAwesomeIcons.hourglassEnd,
                      iconBgColor: Colors.yellow[200],
                      iconColor: Colors.purple,
                    ),
                    CardChiTietTietKiem(
                      tieuDe: 'Loại tiết kiệm',
                      giaTri: chiTietMucTieu.loaiTietKiem,
                      giaTriColor: Colors.yellow,
                      icon: FontAwesomeIcons.cannabis,
                      iconBgColor: Colors.teal[200],
                      iconColor: Colors.orange[900],
                    ),
                    CardChiTietTietKiem(
                      tieuDe: 'Số ngày hoàn thành',
                      giaTri: '${chiTietMucTieu.soNgayHoanThanh}',
                      giaTriColor: Colors.purple,
                      icon: FontAwesomeIcons.cloudSun,
                      iconBgColor: Colors.pink[200],
                      iconColor: Colors.yellow[600],
                    ),
                    CardChiTietTietKiem(
                      tieuDe: 'Số ngày chưa hoàn thành',
                      giaTri: '${chiTietMucTieu.soNgayChuaHoanThanh}',
                      giaTriColor: Colors.red[900],
                      icon: FontAwesomeIcons.cloudSunRain,
                      iconBgColor: Colors.pink[200],
                      iconColor: Colors.blueGrey,
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
                      SizedBox(height: 10.0),
                      Material(
                        elevation: 3.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          width: 250.0,
                          child: CheckboxListTile(
                            title: Text(
                              '20-10-2020',
                              style: TextStyle(
                                fontFamily: 'Lobster',
                                letterSpacing: 1.1,
                                fontSize: 15.0,
                                color: Colors.pinkAccent,
                              ),
                            ),
                            secondary: Icon(
                              Icons.date_range,
                              color: Colors.pink.shade300,
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            checkColor: Colors.pink,
                            activeColor: Colors.white,
                            value: true,
                            onChanged: (value) {},
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
