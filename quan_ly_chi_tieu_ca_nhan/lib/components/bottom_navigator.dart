import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigator extends StatelessWidget {
  final int selectedIndex;

  BottomNavigator({@required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedLabelStyle: TextStyle(
        decoration: TextDecoration.underline,
        fontWeight: FontWeight.bold,
      ),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.blue,
          ),
          label: 'Trang chủ',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.piggyBank,
            color: Colors.pinkAccent,
          ),
          label: 'Bỏ heo',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.coins,
            color: Colors.yellow,
          ),
          label: 'Chi tiêu',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.red,
      //onTap: _onItemTapped,
    );
  }
}
