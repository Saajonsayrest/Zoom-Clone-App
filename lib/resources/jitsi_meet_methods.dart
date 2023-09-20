import 'package:flutter/cupertino.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:zoom_clone/resources/auth_methods.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();

  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
  }) async {
    try {
      var options = JitsiMeetingOptions(
        roomNameOrUrl: roomName,
        userDisplayName: _authMethods.user.displayName,
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
