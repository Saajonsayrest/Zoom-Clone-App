import 'package:flutter/cupertino.dart';
import 'package:zoom_clone/screens/contacts_screen.dart';
import 'package:zoom_clone/screens/history_meeting_screen.dart';
import 'package:zoom_clone/screens/home_screen.dart';
import 'package:zoom_clone/screens/join_screen.dart';
import 'package:zoom_clone/screens/login_screen.dart';
import 'package:zoom_clone/screens/schedule_screen.dart';
import 'package:zoom_clone/screens/screen_share_screen.dart';
import 'package:zoom_clone/screens/video_call_screen.dart';

import '../screens/meeting_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/login': (context) => const LoginScreen(),
    '/home': (context) => const HomeScreen(),
    '/history': (context) => const HistoryMeetingScreen(),
    '/contacts': (context) => const ContactsScreen(),
    '/meeting': (context) => const MeetingScreen(),
    '/join': (context) => const JoinScreen(),
    '/schedule': (context) => const ScheduleScreen(),
    '/screen-share': (context) => const ScreenShareScreen(),
    '/video-call': (context) => const VideoCallScreen(),
  };
}
