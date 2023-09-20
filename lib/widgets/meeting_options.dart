import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_clone/extension/padding_extensions.dart';
import 'package:zoom_clone/utils/colors.dart';

class MeetingOption extends StatelessWidget {
  const MeetingOption(
      {super.key, required this.text, required this.isMute, this.onChanged});

  final String text;
  final bool isMute;
  final Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      color: secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 12.h),
          ).pL(10.w),
          Switch.adaptive(value: isMute, onChanged: onChanged).pR(5.w)
        ],
      ),
    );
  }
}
