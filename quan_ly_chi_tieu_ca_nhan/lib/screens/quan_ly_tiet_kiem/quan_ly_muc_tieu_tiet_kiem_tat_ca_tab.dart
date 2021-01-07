import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/api/quan_ly_tiet_kiem_api.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/card_ThongKeItem.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/muctieu_Item.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/nut_bam.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/list_muc_tieu.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/nguoi_dung.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/thong_ke_tiet_kiem.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/quan_ly_tiet_kiem/quan_ly_muc_tieu_tiet_kiem_chi_tiet_page.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/quan_ly_tiet_kiem/them_muc_tieu_tiet_kiem_page.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/color_picker.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/constants.dart';

class QuanLyMucTieuTietKiemTatCaTab extends StatefulWidget {
  final NguoiDung nguoiDung;

  QuanLyMucTieuTietKiemTatCaTab({this.nguoiDung});

  @override
  _QuanLyMucTieuTietKiemTatCaTabState createState() =>
      _QuanLyMucTieuTietKiemTatCaTabState();
}

class _QuanLyMucTieuTietKiemTatCaTabState
    extends State<QuanLyMucTieuTietKiemTatCaTab> {
  final currencyFormat = NumberFormat('###,###,###,###');
  List<MucTieuTietKiem> dsMucTieu = [];
  ThongKeTietKiem thongKeTietKiem = ThongKeTietKiem();

  void getAllMucTieu() async {
    MucTieuApi mucTieuApi = MucTieuApi();
    List<MucTieuTietKiem> list =
        await mucTieuApi.getAllMucTieu(widget.nguoiDung.id);

    if (list != null)
      setState(() {
        dsMucTieu = list;
      });
  }

  void getAllThongKeTietKiem() async {
    MucTieuApi mucTieuApi = MucTieuApi();
    ThongKeTietKiem thongKe =
        await mucTieuApi.thongKeTietKiem(widget.nguoiDung.id);

    if (thongKe != null)
      setState(() {
        thongKeTietKiem = thongKe;
      });
  }

  List<Widget> renderAllMucTieu() {
    List<Widget> listWidget = [];
    for (var muctieu in dsMucTieu) {
      print(muctieu.trangThai);
      MuctieuItem item = MuctieuItem(
        barColor: ColorPicker().random(),
        textColor: ColorPicker().random(),
        textName: muctieu.tenMucTieu,
        icon: muctieu.trangThai == true
            ? FontAwesomeIcons.award
            : FontAwesomeIcons.clipboardCheck,
        iconColor: muctieu.trangThai == true ? Colors.red : Colors.green,
        onItemPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return QuanLyMucTieuTietKiemChiTietPage(
              idMucTieu: muctieu.id,
              onChanged: () {
                getAllMucTieu();
                getAllThongKeTietKiem();
              },
            );
          }));
        },
      );

      listWidget.add(item);
    }
    return listWidget;
  }

  @override
  void initState() {
    getAllMucTieu();
    getAllThongKeTietKiem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: kPaddingMainPage,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            elevation: 10.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ThongKeItem(
                      textName: 'Tổng tiền tiết kiệm',
                      textNumber:
                          '${currencyFormat.format(thongKeTietKiem.tongTienTietKiem)} ₫',
                      colorName: Colors.purple[300],
                      colorNumber: Colors.red[700],
                    ),
                    ThongKeItem(
                      textName: 'Tổng tiền đã tiết kiệm',
                      textNumber:
                          '${currencyFormat.format(thongKeTietKiem.tongTienDaTietKiem)} ₫',
                      colorName: Colors.blueGrey[300],
                      colorNumber: Colors.green[700],
                    ),
                  ],
                ),
                SizedBox(
                  width: 350.0,
                  height: 1.0,
                  child: const DecoratedBox(
                    decoration: const BoxDecoration(color: Color(0xFFE0E0E0)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ThongKeItem(
                      textName: 'Số mục tiêu\nhoàn thành',
                      textNumber: thongKeTietKiem.soMTHoanThanh.toString(),
                      colorName: Colors.blue[400],
                      colorNumber: Colors.pink[300],
                    ),
                    ThongKeItem(
                      textName: 'Số mục tiêu\nchưa hoàn thành',
                      textNumber: thongKeTietKiem.soMTChuaHoanThanh.toString(),
                      colorName: Colors.orange[400],
                      colorNumber: Colors.blue[700],
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: renderAllMucTieu(),
            ),
          ),
          NutBam(
            textName: 'Thêm mục tiêu tiết kiệm',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ThemMucTieuTietKiemPage(
                      idNguoiDung: widget.nguoiDung.id,
                      onSuccess: () {
                        getAllMucTieu();
                        getAllThongKeTietKiem();
                      },
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
