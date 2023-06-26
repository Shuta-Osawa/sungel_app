import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sungel_app/products/home/home_body.dart';

import '../Achievement/achievement.dart';
import '../report//report.dart';
import '../sales/sales.dart';
import '../calendar/calendar.dart';

class Home extends StatefulWidget {
  const Home(User user, {Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final _pages = <Widget>[
    const HomeBody(),
    const Achievement(),
    const Pace(),
    const Sales(),
    const Calendar(),
  ];

  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        toolbarHeight: 80,
        title: const Text(
          'しゅうた',
          style: TextStyle(
              color: Colors.indigoAccent,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home_filled),
            label: 'ホーム',
            backgroundColor: Colors.lightGreenAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: '実績',
            backgroundColor: Colors.lightGreenAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insights),
            label: 'レポート',
            backgroundColor: Colors.lightGreenAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: '売上',
            backgroundColor: Colors.lightGreenAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'カレンダー',
            backgroundColor: Colors.lightGreenAccent,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTapItem,
        selectedIconTheme:
        const IconThemeData(size: 30, color: Colors.indigoAccent),
        selectedLabelStyle: const TextStyle(color: Colors.indigoAccent),
        unselectedIconTheme: const IconThemeData(size: 25, color: Colors.blue),
        unselectedLabelStyle: const TextStyle(color: Colors.blue),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.lightGreenAccent,
      ),
    );
  }
}
