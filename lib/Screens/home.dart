import 'package:dst/Screens/profile.dart';
import 'package:dst/Screens/work.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  List pages = const [WorkProfile(), MyProfile()];

  void updatePage(int index) {
    setState(() {
      _page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          iconSize: 28,
          onTap: updatePage,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                width: 40,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _page == 0 ? Colors.black : Colors.white,
                        width: 5),
                  ),
                ),
                child: Icon(_page == 0 ? Icons.home : Icons.home_outlined),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 40,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _page == 1 ? Colors.black : Colors.white,
                        width: 5),
                  ),
                ),
                child: Icon(_page == 1 ? Icons.person : Icons.person_outlined),
              ),
              label: '',
            )
          ]),
    );
  }
}
