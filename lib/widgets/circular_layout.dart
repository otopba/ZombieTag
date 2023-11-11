import 'dart:math';
import 'package:flutter/material.dart';

class CircularLayout extends StatelessWidget {
  const CircularLayout({
    super.key,
    required this.children,
    this.radius = 100.0,
  });

  final List<Widget> children;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(children.length, (index) {
        final double angle = (360 / children.length) * index;
        final double radian = angle * pi / 180;
        final double x = radius * cos(radian);
        final double y = radius * sin(radian);

        return Positioned(
          left: radius + x,
          top: radius + y,
          child: children[index],
        );
      }),
    );
  }
}
