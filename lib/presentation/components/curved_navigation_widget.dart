import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:princess_diaries/presentation/main/main_screen.dart';
import 'package:princess_diaries/presentation/time_line/time_line_screen.dart';

class CurvedNavigationWidget extends StatefulWidget {
  const CurvedNavigationWidget({Key? key}) : super(key: key);

  @override
  State<CurvedNavigationWidget> createState() => _CurvedNavigationWidgetState();
}

class _CurvedNavigationWidgetState extends State<CurvedNavigationWidget> {
  int index = 0;
  final screens = [
    const MainScreen(),
    const TimeLineScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 75,
        color: Colors.black,
        backgroundColor: Colors.transparent,
        items: const <Widget>[
          Icon(
            Icons.calendar_month,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.list,
            size: 30,
            color: Colors.white,
          ),
        ],
        index: index,
        onTap: (index) => setState(() => this.index = index),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: screens[index],
    );
  }
}
