import 'package:flutter/material.dart';
import 'package:sih_project/UserPages/HomePage.dart';
import 'package:sih_project/UserPages/Learning.dart';
import 'package:sih_project/UserPages/Settings.dart';

class BottomNavi extends StatefulWidget {
  @override
  _BottomNaviState createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> {
  int _currentIndex = 0;

  final List<Widget> _screens = [HomePage(), Learning(), Settings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.home,
              color: Color.fromRGBO(78, 76, 187, 1),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.play_arrow,
              color: Color.fromRGBO(78, 76, 187, 1),
            ),
            label: 'Learning',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.settings,
              color: Color.fromRGBO(78, 76, 187, 1),
            ),
            label: 'Settings',
          ),
        ],
        selectedItemColor: Color.fromRGBO(78, 76, 187, 1),
        unselectedItemColor: Color.fromRGBO(78, 76, 187, 1),
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen 1'),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen 2'),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Screen 3'),
    );
  }
}
