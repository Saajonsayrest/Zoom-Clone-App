import 'package:flutter/cupertino.dart';
import 'package:zoom_clone/screens/contacts_screen.dart';
import 'package:zoom_clone/screens/history_meeting_screen.dart';
import 'package:zoom_clone/screens/home_screen.dart';
import 'package:zoom_clone/screens/login_screen.dart';
import 'package:zoom_clone/screens/video_call_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/login': (context) => const LoginScreen(),
    '/home': (context) => const HomeScreen(),
    '/history': (context) => const HistoryMeetingScreen(),
    '/contacts': (context) => const ContactsScreen(),
    '/video-call': (context) => const VideoCallScreen(),
  };
}
