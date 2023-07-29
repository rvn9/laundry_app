import 'package:flutter/material.dart';

class CustomContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, size.height / 3 - 20)
      ..quadraticBezierTo(
          size.width * 0.10, size.height / 3, 0, size.height / 3 + 20)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height / 3 + 20)
      ..quadraticBezierTo(
          size.width * 0.90, size.height / 3, size.width, size.height / 3 - 20)
      ..lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
