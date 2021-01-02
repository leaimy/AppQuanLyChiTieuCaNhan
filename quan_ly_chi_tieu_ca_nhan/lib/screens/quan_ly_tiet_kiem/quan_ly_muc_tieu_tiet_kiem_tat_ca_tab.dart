import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/api/list_muc_tieu.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/card_ThongKeItem.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/muctieu_Item.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/nut_bam.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/list_muc_tieu.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/nguoi_dung.dart';
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
  List<MucTieuTietKiem> dsMucTieu = [];

  void getAllMucTieu() async {
    MucTieuApi mucTieuApi = MucTieuApi();
    List<MucTieuTietKiem> list =
        await mucTieuApi.getAllMucTieu(widget.nguoiDung.id);

    setState(() {
      dsMucTieu = list;
    });
  }

  List<Widget> renderAllMucTieu() {
    List<Widget> listWidget = [];
    for (var muctieu in dsMucTieu) {
      MuctieuItem item = MuctieuItem(
        barColor: ColorPicker().random(),
        textColor: ColorPicker().random(),
        textName: muctieu.tenMucTieu,
        icon: muctieu.trangThai == true
            ? FontAwesomeIcons.gem
            : FontAwesomeIcons.fan,
        iconColor: muctieu.trangThai == true ? Colors.blue : Colors.red,
        onItemPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return QuanLyMucTieuTietKiemChiTietPage();
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
                ThongKeItem(
                  textName: 'Tổng tiền tiết kiệm',
                  textNumber: '500.000 VND',
                  colorName: Colors.purple[300],
                  colorNumber: Colors.red[700],
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
                      textNumber: '3',
                      colorName: Colors.blue[400],
                      colorNumber: Colors.pink[300],
                    ),
                    ThongKeItem(
                      textName: 'Số mục tiêu\nchưa hoàn thành',
                      textNumber: '2',
                      colorName: Colors.orange[400],
                      colorNumber: Colors.green[600],
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
              child: ListView(
            children: renderAllMucTieu(),
          )),
          NutBam(
            textName: 'Thêm mục tiêu tiết kiệm',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ThemMucTieuTietKiemPage();
              }));
            },
          ),
        ],
      ),
    );
  }
}
