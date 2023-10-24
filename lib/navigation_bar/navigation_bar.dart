import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_8_9/navigation_bar/lottie_animation/lottie_animation.dart';

import 'home/home.dart';

class MainPagee extends StatefulWidget {
  const MainPagee({super.key});

  @override
  State<MainPagee> createState() => _MainPageeState();
}

class _MainPageeState extends State<MainPagee> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Bottom Navigation Bar"),
      ),
      body: Center(
        child: _selectedIndex == 0
            ? HomePage()
            : LottieAnimationPage(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: "Animate",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}