import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/api/quan_ly_tien_api.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/muctieu_Item.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/rounded_summary_box.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/rounded_summary_card.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/list_quan_ly_tien.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/nguoi_dung.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/models/quan_ly_tien_thong_ke_tong_quan.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/quan_ly_tien/quan_ly_tien_chi_tiet_page.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/quan_ly_tien/them_quan_ly_tien.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/color_picker.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/constants.dart';

class QuanLyTienTatCaTab extends StatefulWidget {
  final NguoiDung nguoiDung;

  QuanLyTienTatCaTab({this.nguoiDung});

  @override
  _QuanLyTienTatCaTabState createState() => _QuanLyTienTatCaTabState();
}

class _QuanLyTienTatCaTabState extends State<QuanLyTienTatCaTab> {
  final dateFormat = new DateFormat('dd-MM-yyyy');
  final currencyFormat = new NumberFormat('###,###,###,###');
  List<ListQuanLyTien> dsQuanLyTien = [];
  QuanLyTienThongKeTongQuan thongKe = QuanLyTienThongKeTongQuan();

  void getThongKeTongQuan() async {
    QuanLyTienApi api = QuanLyTienApi();
    QuanLyTienThongKeTongQuan data =
        await api.getQuanLyTienThongKeTongQuan(widget.nguoiDung.id);

    if (data != null)
      setState(() {
        thongKe = data;
      });
  }

  void getDanhSachQuanLyTien() async {
    QuanLyTienApi api = QuanLyTienApi();
    List<ListQuanLyTien> list = await api.getAllQuanLyTien(widget.nguoiDung.id);

    if (list != null)
      setState(() {
        dsQuanLyTien = list;
      });
  }

  @override
  void initState() {
    getThongKeTongQuan();
    getDanhSachQuanLyTien();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: kPaddingMainPage,
      child: ListView(
        children: [
          RoundedSummaryCard(
            title: 'Tổng số tiền đã quản lý',
            money: '${currencyFormat.format(thongKe.tongSoTienDaQuanLy)} ₫',
            icon: Icons.account_balance_outlined,
            iconBgColor: Colors.blue[200],
            iconColor: Colors.orange,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(
                  child: ThemQuanLyTienPage(
                    idNguoiDung: widget.nguoiDung.id,
                    onSuccess: () {
                      getThongKeTongQuan();
                      getDanhSachQuanLyTien();
                    },
                  ),
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                ),
              );
            },
          ),
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RoundedSummaryBox(
                title: 'Tổng số tiền đã chi tiêu',
                money:
                    '${currencyFormat.format(thongKe.tongSoTienDaChiTieu)} ₫',
                icon: Icons.money_off,
                iconBgColor: Colors.purple[200],
                iconColor: Colors.yellow,
              ),
              SizedBox(width: 20.0),
              RoundedSummaryBox(
                title: 'Số lượng kế hoạch đã hoàn thành',
                money: thongKe.tongSoKeHoachQuanLyDaHoanThanh.toString(),
                icon: Icons.done_all,
                iconBgColor: Colors.yellow[200],
                iconColor: Colors.purple,
              ),
            ],
          ),
          SizedBox(height: 30.0),
          Text(
            'Danh sách kế hoạch quản lý tiền:',
            style: kTitleTextStyle,
          ),
          SizedBox(height: 15.0),
          Container(
            height: 350.0,
            child: ListView.builder(
              itemBuilder: (context, index) {
                ListQuanLyTien quanLyTien = dsQuanLyTien[index];
                return MuctieuItem(
                  textName:
                      '${dateFormat.format(quanLyTien.ngayBD)} - ${dateFormat.format(quanLyTien.ngayKT)}',
                  textColor: ColorPicker().random(),
                  barColor: ColorPicker().random(),
                  icon: quanLyTien.trangThai == true
                      ? FontAwesomeIcons.award
                      : FontAwesomeIcons.clipboardCheck,
                  iconColor:
                      quanLyTien.trangThai == true ? Colors.red : Colors.green,
                  onItemPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return QuanLyTienChiTietPage(
                            quanLyTienID: quanLyTien.id,
                            idNguoiDung: widget.nguoiDung.id,
                            onChanged: () {
                              getThongKeTongQuan();
                              getDanhSachQuanLyTien();
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              },
              itemCount: dsQuanLyTien.length,
            ),
          ),
        ],
      ),
    );
  }
}
