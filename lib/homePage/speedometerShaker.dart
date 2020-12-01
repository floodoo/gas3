import 'package:flutter/material.dart';
import 'package:gas3/homePage/speedometer.dart';

class SpeedometerShaker extends StatefulWidget {
  const SpeedometerShaker(this.speedInKmh);

  final double speedInKmh;

  @override
  _SpeedometerShakerState createState() => _SpeedometerShakerState();
}

class _SpeedometerShakerState extends State<SpeedometerShaker>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Animation<double> offsetAnimation = Tween(begin: 0.0, end: 24.0)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(controller)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller.reverse();
            }
          });
    controller.forward(from: 0.0);
    return AnimatedBuilder(
      animation: offsetAnimation,
      builder: (context, child) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 24.0),
          padding: EdgeInsets.only(
              left: offsetAnimation.value + 30.0,
              right: 30.0 - offsetAnimation.value),
          child: Speedometer(widget.speedInKmh),
        );
      },
    );
  }
}
