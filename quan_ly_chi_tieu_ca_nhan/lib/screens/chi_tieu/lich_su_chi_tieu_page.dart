import 'package:flutter/material.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/nut_bam.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/outcome_date_box.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/components/transaction_iten.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/screens/chi_tieu/them_chi_tieu_page.dart';
import 'package:quan_ly_chi_tieu_ca_nhan/utils/constants.dart';

class LichSuChiTieuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lịch sử chi tiêu'),
      ),
      body: SafeArea(
        child: Container(
          padding: kPaddingMainPage,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text('Ngày:', style: kTitleTextStyle),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 110.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    OutcomeDate(
                      date: '29',
                      month: 'Tháng 09',
                      color: Colors.white,
                      textColor: Colors.grey.shade600,
                    ),
                    OutcomeDate(
                      date: '30',
                      month: 'Tháng 09',
                      textColor: Colors.white,
                    ),
                    OutcomeDate(
                      date: '01',
                      month: 'Tháng 10',
                      color: Colors.white,
                      textColor: Colors.grey.shade600,
                    ),
                    OutcomeDate(
                      date: '02',
                      month: 'Tháng 10',
                      color: Colors.white,
                      textColor: Colors.grey.shade600,
                    ),
                    OutcomeDate(
                      date: '03',
                      month: 'Tháng 10',
                      color: Colors.white,
                      textColor: Colors.grey.shade600,
                    ),
                    OutcomeDate(
                      date: '04',
                      month: 'Tháng 10',
                      color: Colors.white,
                      textColor: Colors.grey.shade600,
                    ),
                    OutcomeDate(
                      date: '05',
                      month: 'Tháng 10',
                      color: Colors.white,
                      textColor: Colors.grey.shade600,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.0),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text('Chi tiết giao dịch:', style: kTitleTextStyle),
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(left: 5.0),
                  children: [
                    TransactionItem(
                      barColor: Colors.pinkAccent,
                      icon: Icons.eco,
                      iconColor: Colors.purpleAccent,
                      amount: '50.000',
                      title: 'Đi chợ mua đồ ăn',
                    ),
                    TransactionItem(
                      barColor: Colors.greenAccent,
                      icon: Icons.account_balance_sharp,
                      iconColor: Colors.lightBlue,
                      amount: '10.000',
                      title: 'Mua nước uống',
                    ),
                    TransactionItem(
                      barColor: Colors.red,
                      icon: Icons.party_mode,
                      iconColor: Colors.orange,
                      amount: '100.000',
                      title: 'Dự tiệc sinh nhật bạn 🎂🎂🎂',
                    ),
                    TransactionItem(
                      barColor: Colors.yellow,
                      icon: Icons.play_arrow,
                      iconColor: Colors.orange,
                      amount: '200.000',
                      title: 'Dự tiệc đám cưới bạn 😂😂😂',
                    ),
                    TransactionItem(
                      barColor: Colors.lightBlue,
                      icon: Icons.access_time,
                      iconColor: Colors.pink,
                      amount: '50.000',
                      title: 'Tiền lung tung',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0, width: double.infinity),
              Container(
                width: double.infinity,
                child: NutBam(
                  textName: 'Thêm chi tiêu mới',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ThemChiTieuPage();
                    }));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
