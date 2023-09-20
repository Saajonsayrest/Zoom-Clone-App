import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_clone/utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 50.0,
    this.radius = 30.0,
  });

  final String text;
  final Function()? onPressed;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          minimumSize: Size(double.infinity, height.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius.r),
              side: const BorderSide(color: buttonColor)),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 17.sp),
        ),
      ),
    );
  }
}
