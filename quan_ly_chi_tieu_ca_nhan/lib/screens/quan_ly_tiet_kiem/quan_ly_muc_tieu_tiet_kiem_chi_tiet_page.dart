import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/api/quan_ly_tiet_kiem_api.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/card_chi_tiet_tiet_kiem.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/circle_date_box.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/chi_tiet_muc_tieu.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/chi_tiet_ngay_tiet_kiem.dart';

class QuanLyMucTieuTietKiemChiTietPage extends StatefulWidget {
  final int idMucTieu;
  final Function onChanged;

  QuanLyMucTieuTietKiemChiTietPage({this.idMucTieu, this.onChanged});
  @override
  _QuanLyMucTieuTietKiemChiTietPageState createState() =>
      _QuanLyMucTieuTietKiemChiTietPageState();
}

class _QuanLyMucTieuTietKiemChiTietPageState
    extends State<QuanLyMucTieuTietKiemChiTietPage> {
  final dateFormat = new DateFormat('dd-MM-yyyy');
  final currencyFormat = NumberFormat('###,###,###,###');
  final mucTieuApi = MucTieuApi();
  ChiTietMucTieu chiTietMucTieu = ChiTietMucTieu();
  List<ChiTietNgayTietKiem> dsNgay = [];
  DateTime ngayBD = DateTime.now();
  DateTime ngayKT = DateTime.now();

  bool isCheck = false;
  DateTime selectedDate = DateTime.now();

  void getChiTietMucTieu() async {
    ChiTietMucTieu data = await mucTieuApi.chiTietMucTieu(widget.idMucTieu);
    if (data != null)
      setState(() {
        chiTietMucTieu = data;
      });
  }

  void getChiTietNgay() async {
    List<ChiTietNgayTietKiem> data =
        await mucTieuApi.getNgayTietKiem(widget.idMucTieu);

    if (data != null)
      setState(() {
        dsNgay = data;
      });
  }

  bool getTrangThaiByDate(DateTime date) {
    for (var item in dsNgay) {
      if (item.ngayTietKiem.difference(date).inDays == 0) {
        return item.trangThai;
      }
    }

    return null;
  }

  void setTrangThaiByDate(DateTime date) {
    DateTime now = DateTime.now();
    if (date.difference(now.add(Duration(days: 1))).inDays == 0) return;
    if (date.difference(now).inDays <= 0) {
      setState(() {
        isCheck = true;
        for (var item in dsNgay) {
          if (item.ngayTietKiem.difference(date).inDays == 0) {
            item.trangThai = true;
            break;
          }
        }
      });
    }
  }

  void handleCircleDatePressed(DateTime pressedDate, bool status) {
    setState(() {
      selectedDate = pressedDate;
      isCheck = status != null ? status : false;
    });
  }

  @override
  void initState() {
    getChiTietMucTieu();
    getChiTietNgay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                FontAwesomeIcons.bell,
                color: Colors.yellow,
              ),
            ),
          )
        ],
        title: Text(
          'Chi tiết mục tiêu tiết kiệm',
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
                      tieuDe: 'Động lực',
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
                              '${dateFormat.format(selectedDate)}',
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
                            value: isCheck,
                            onChanged: (value) async {
                              if (value == true) {
                                setTrangThaiByDate(selectedDate);
                                await mucTieuApi.capNhatTrangThaiMucTieu(
                                  idMucTieu: widget.idMucTieu,
                                  date: selectedDate,
                                );
                                getChiTietMucTieu();
                                if (widget.onChanged != null)
                                  widget.onChanged();
                              }
                            },
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
                          if (isToday == true) {
                            if (getTrangThaiByDate(now) == null)
                              return CircleDateBox(
                                text: now.day.toString(),
                                color: Colors.green,
                                onPressed: () {},
                              );

                            return CircleDateBox(
                              text: now.day.toString(),
                              color: Colors.green,
                              onPressed: () {
                                handleCircleDatePressed(
                                    now, getTrangThaiByDate(now));
                              },
                            );
                          }

                          if (chiTietMucTieu.ngayBD.compareTo(now) <= 0 &&
                              chiTietMucTieu.ngayKT.compareTo(now) >= 0) {
                            if (now.compareTo(DateTime.now()) > 0 &&
                                getTrangThaiByDate(now) != null)
                              return CircleDateBox(
                                text: now.day.toString(),
                                color: Colors.pink[200],
                                onPressed: () {},
                              );

                            bool trangThai = getTrangThaiByDate(now);
                            if (trangThai == true) {
                              return CircleDateBox(
                                text: now.day.toString(),
                                color: Colors.pink[600],
                                onPressed: () {
                                  handleCircleDatePressed(now, true);
                                },
                              );
                            } else if (trangThai == false) {
                              return CircleDateBox(
                                text: now.day.toString(),
                                color: Colors.pink[200],
                                onPressed: () {
                                  handleCircleDatePressed(now, false);
                                },
                              );
                            }

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
