import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_app/gen/colors.gen.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback onClick;
  final String title;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  const CustomButtonWidget({
    super.key,
    required this.onClick,
    required this.title,
    this.backgroundColor = ColorName.dodgerBlue,
    this.borderColor = Colors.transparent,
    this.textColor = ColorName.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: borderColor),
        ),
      ),
      onPressed: onClick,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
      ),
    );
  }
}
