import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 20.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 50.0,
                          height: 50.0,
                          child: CircleAvatar(
                            radius: 50.0,
                            backgroundColor: Colors.red,
                            backgroundImage: NetworkImage(
                                'https://lh3.googleusercontent.com/-QZRg-UUXYO4/XHfudQc9FtI/AAAAAAAAAC8/Skk2T0W6tpAYP5h6arJDF4gcFAUO7KjLACEwYBhgLKtMDAL1OcqwCvPeZyZxOO6J6Z-dcM0WGrl9_s9AbANUWyc5cWeDYHMBfyHWpaWBe-0XQNK2rAvKXCUKFegV59TBjGrCgiGbSkcFto7kD3RKmupK46rrFGH_FQXdYI1rj1zuOp1Uu6dQgJZFSBb6XHGUKw9ho5b7rsu_6E2O2KkqnoN0oL_fpCRMBUVTJ7JyKjhL3swtDnn2eNeDZ9H4hXocobusfL9PCWa8FjlxflYD73auShoscVMRM8P9D3gCCZ2fUhIT9lhppt7oRvaM1RGOmcuP6EVuWV2cyvMLLiXVJtmXOyqfu6psJT1Zpfa1RrdzMD34ojLVGb9yLArKHRekw4Hg5l71d0f4PV1MW9hVIcmrVYVvS6ZXDC5VwsvM-dopHWlOGup5zXq_KQO9jJZJeEISD5qbfucDyXplphTwDJyr5uYpTRpME7yg9V_jf1LOrb4_D8r6v4ihUDd4C9LF3M-D3DSDtRau7Eux4ADsb3DvsR3N8YqiSdw85REuO1ezZ4i2jA3Hy-m7yr34GWxrqyBCucaDaVGB3apJ9vR6n2VkdGETx5tEOYLdUcOo8CgXNJm_vIt_auLFVc0PJTyd5riSvjlTr1FJAX9e37wUGU0yRs4Uwh-fx_gU/w139-h140-p/nancy.jpg'),
                          ),
                        ),
                        Text(
                          'Nguyen Thi Ha',
                          style: TextStyle(fontSize: 18.0),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ThongKeItem(
                        tenHienThi: 'Tổng tiền tiết kiệm',
                        soTien: '2.500.000 VND',
                        mauTen: Colors.purple,
                        mauSo: Colors.black,
                      ),
                      SizedBox(
                        height: 1.0,
                        child: Container(color: Colors.grey.shade300),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ThongKeItem(
                            tenHienThi: 'Số mục tiêu\nhoàn thành',
                            soTien: '10',
                            mauTen: Colors.green,
                            mauSo: Colors.black,
                          ),
                          ThongKeItem(
                            tenHienThi: 'Số mục tiêu\nchưa hoàn thành',
                            soTien: '2',
                            mauTen: Colors.yellow,
                            mauSo: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 5.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ThongKeItem(
                        tenHienThi: 'Tổng tiền tiết kiệm',
                        soTien: '2.500.000 VND',
                        mauTen: Colors.purple,
                        mauSo: Colors.black,
                      ),
                      SizedBox(
                        height: 1.0,
                        child: Container(color: Colors.grey.shade300),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ThongKeItem(
                            tenHienThi: 'Số mục tiêu\nhoàn thành',
                            soTien: '10',
                            mauTen: Colors.green,
                            mauSo: Colors.black,
                          ),
                          ThongKeItem(
                            tenHienThi: 'Số mục tiêu\nchưa hoàn thành',
                            soTien: '2',
                            mauTen: Colors.yellow,
                            mauSo: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ThongKeItem extends StatelessWidget {
  final String tenHienThi;
  final String soTien;
  final Color mauTen;
  final Color mauSo;

  ThongKeItem({this.tenHienThi, this.soTien, this.mauTen, this.mauSo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
        left: 30.0,
        right: 30.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            tenHienThi,
            style: TextStyle(
              color: mauTen,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 3.0,
          ),
          Text(
            soTien,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: mauSo,
            ),
          ),
        ],
      ),
    );
  }
}
