import 'package:flutter/cupertino.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:zoom_clone/resources/auth_methods.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();

  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String userName = '',
  }) async {
    try {
      String name;
      if (userName.isEmpty) {
        name = _authMethods.user.displayName!;
      } else {
        name = userName;
      }
      var options = JitsiMeetingOptions(
        roomNameOrUrl: roomName,
        userDisplayName: name,
        userAvatarUrl: _authMethods.user.photoURL,
        userEmail: _authMethods.user.email,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
      );
      await JitsiMeetWrapper.joinMeeting(options: options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }
}
