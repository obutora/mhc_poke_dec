import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'dart:math';

class RotateBall extends StatelessWidget {
  RotateBall({Key key, @required this.delay, @required this.onPressed})
      : super(key: key);

  final int delay;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomAnimation(
      control: CustomAnimationControl.MIRROR,
      delay: Duration(milliseconds: delay),
      curve: Curves.elasticOut,
      tween: Tween<double>(begin: -0.03, end: 0.01),
      duration: const Duration(milliseconds: 555),
      child: IconButton(
        icon: Image.asset(
          'assets/ball.png',
        ),
        iconSize: 60,
        onPressed: onPressed,
      ),
      builder: (context, child, value) {
        return Transform.rotate(angle: (pi * value), child: child);
      },
    );
  }
}
