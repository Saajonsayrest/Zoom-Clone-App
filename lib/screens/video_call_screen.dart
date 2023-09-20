import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_clone/extension/padding_extensions.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/custom_button.dart';
import 'package:zoom_clone/widgets/meeting_options.dart';

class VideoCallScreen extends StatefulHookWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethods _authMethods = AuthMethods();
  bool isAudioMuted = true;
  bool isVideoMuted = true;

  _joinMeeting() {}

  @override
  Widget build(BuildContext context) {
    final meetingIdController = useTextEditingController();
    final nameController =
        useTextEditingController(text: _authMethods.user.displayName);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
          'Join a Meeting',
          style: TextStyle(fontSize: 18.sp),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 60.h,
            child: TextField(
              controller: meetingIdController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Meeting ID',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.sp,
                  ),
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none),
            ).pT(10.h),
          ),
          SizedBox(
            height: 60.h,
            child: TextField(
              controller: nameController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Name',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.sp,
                  ),
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none),
            ).pT(10.h),
          ),
          CustomButton(
            text: 'Join',
            onPressed: _joinMeeting,
            height: 30.h,
            radius: 11.r,
          ),
          const Text(
            'JOIN OPTIONS',
            style: TextStyle(fontWeight: FontWeight.bold),
          ).pL(10.w).pB(8.h),
          MeetingOption(
            text: "Don't Connect to Audio",
            isMute: isAudioMuted,
            onChanged: (bool val) {
              setState(() {
                isAudioMuted = val;
              });
            },
          ),
          MeetingOption(
            text: "Turn Off My Video",
            isMute: isVideoMuted,
            onChanged: (bool val) {
              setState(() {
                isVideoMuted = val;
              });
            },
          ),
        ],
      ),
    );
  }
}
