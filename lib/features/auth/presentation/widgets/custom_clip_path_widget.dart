import 'package:flutter/material.dart';
import 'package:store_app/core/layouts/style.dart';

class CustomClipPathWidget extends StatelessWidget {
  const CustomClipPathWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomClipPath(),
      child: Container(
        alignment: Alignment.topLeft,
        width: double.infinity,
        height: 320,
        decoration: const BoxDecoration(
          color: defaultAppColorWithOpacity,
        ),
        child: Opacity(
          opacity: 0.6,
          child: SafeArea(
            child: Image.asset(
              'assets/images/hand.png',
              scale: 2.5,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double y = size.height;
    double x = size.width;

    final path = Path();

    path.lineTo(0, y);

    Offset firstStart = Offset(x * 0.18, y * 0.66);
    Offset firstEnd = Offset(x * 0.60, y * 0.5);

    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    Offset secondStart = Offset(x * 0.96, y * 0.375);
    Offset secondEnd = Offset(x, 0);

    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(x, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
