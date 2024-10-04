import 'package:flutter/material.dart';

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 20); // Move to bottom-left
    path.quadraticBezierTo(
        0, size.height, 20, size.height); // Bottom-left curve
    path.lineTo(size.width - 20, size.height); // Line to bottom-right
    path.quadraticBezierTo(size.width, size.height, size.width,
        size.height - 20); // Bottom-right curve
    path.lineTo(size.width, 0); // Line to top-right
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
