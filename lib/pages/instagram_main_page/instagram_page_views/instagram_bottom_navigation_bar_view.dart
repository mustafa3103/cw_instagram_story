import 'package:flutter/material.dart';

class InstagramBottomNavigationBarView extends StatelessWidget {
  const InstagramBottomNavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.black), label: "Home"),
      BottomNavigationBarItem(
          icon: Icon(Icons.search, color: Colors.black), label: "Search"),
      BottomNavigationBarItem(
          icon: Icon(Icons.person_outlined, color: Colors.black), label: "Home")
    ]);
  }
}
