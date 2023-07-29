import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconChipWidget extends StatelessWidget {
  const IconChipWidget({
    Key? key,
    required this.label,
    this.icon,
    this.iconPath,
    this.labelColor = const Color(0xff4e73f8),
    this.backgroundColor = const Color(0x144e73f8),
    this.fontSize = 16,
  }) : super(key: key);

  final String label;
  final IconData? icon;
  final String? iconPath;
  final Color labelColor;
  final double? fontSize;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final icon = this.icon;
    final iconPath = this.iconPath;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: RoundedChipWidget(
        backgroundColor: backgroundColor,
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Icon(
                  icon,
                  color: labelColor,
                  size: 20.0,
                ),
              )
            else if (iconPath != null)
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: ImageIcon(
                  AssetImage(iconPath),
                  color: labelColor,
                  size: 20.0,
                ),
              )
            else
              const SizedBox.shrink(),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 64.w),
              child: Text(
                label,
                style: TextStyle(color: labelColor, fontSize: fontSize?.sp),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedChipWidget extends StatelessWidget {
  const RoundedChipWidget({
    Key? key,
    required this.label,
    this.backgroundColor = const Color(0xfff1f2f3),
  }) : super(key: key);

  final Widget label;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Chip(
      visualDensity: const VisualDensity(horizontal: 0.0, vertical: -1),
      backgroundColor: backgroundColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      label: label,
    );
  }
}
