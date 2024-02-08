import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RotatingOrnament extends StatefulWidget {
  const RotatingOrnament({super.key});

  @override
  State<RotatingOrnament> createState() => _RotatingOrnamentState();
}

class _RotatingOrnamentState extends State<RotatingOrnament>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 30), vsync: this)
          ..repeat(min: 0, max: 1, period: const Duration(seconds: 30));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: SvgPicture.asset('assets/ornament.svg'),
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: controller.value * 2.0 * pi,
          child: child,
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
