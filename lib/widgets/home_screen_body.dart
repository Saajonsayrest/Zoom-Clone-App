import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_clone/resources/jitsi_meet_methods.dart';
import 'package:zoom_clone/widgets/home_screen_buttons.dart';

class HomeScreenBody extends StatelessWidget {
  HomeScreenBody({
    super.key,
  });

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(100000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            HomeScreenButtons(
              onPressed: createNewMeeting,
              icon: Icons.videocam,
              buttonName: 'New Meeting',
              color: Colors.deepOrange.withOpacity(0.95),
            ),
            HomeScreenButtons(
              onPressed: () => joinMeeting(context),
              icon: Icons.add_box_rounded,
              buttonName: 'Join',
            ),
            HomeScreenButtons(
              onPressed: () {
                Navigator.pushNamed(context, '/schedule');
              },
              icon: Icons.calendar_today,
              buttonName: 'Schedule',
            ),
            HomeScreenButtons(
              onPressed: () {
                Navigator.pushNamed(context, '/screen-share');
              },
              icon: Icons.arrow_upward_outlined,
              buttonName: 'Share Screen',
            ),
          ],
        ),
        Expanded(
          child: Center(
            child: Text(
              'Create/Join Meetings with just a Click!',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
