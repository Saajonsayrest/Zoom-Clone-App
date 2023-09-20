import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_clone/extension/padding_extensions.dart';
import 'package:zoom_clone/utils/colors.dart';

class HomeScreenButtons extends StatelessWidget {
  const HomeScreenButtons(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.buttonName,
      this.color = buttonColor});

  final VoidCallback onPressed;
  final IconData icon;
  final String buttonName;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            height: 45.h,
            width: 45.h,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10.r,
                  color: Colors.black.withOpacity(0.06),
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(icon, size: 25.h),
          ).pB(5.h),
          Text(
            buttonName,
            style: TextStyle(fontSize: 10.sp, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
