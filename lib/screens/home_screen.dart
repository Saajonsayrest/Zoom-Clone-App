import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/history_meeting_screen.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;

  List<Widget> pages = [
    HomeScreenBody(),
    const HistoryMeetingScreen(),
    Center(child: const Text('Contacts')),
    Center(child: const Text('Settings')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: pages[_page],
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      title: const Text('Meetings'),
      centerTitle: true,
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: footerColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      onTap: (int page) {
        setState(() {
          _page = page;
        });
      },
      currentIndex: _page,
      type: BottomNavigationBarType.fixed,
      unselectedFontSize: 14,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.comment_bank), label: 'Meet & Chat'),
        BottomNavigationBarItem(icon: Icon(Icons.lock_clock), label: 'Meeting'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined), label: 'Contacts'),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined), label: 'Settings'),
      ],
    );
  }
}
