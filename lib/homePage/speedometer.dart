import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Speedometer extends StatefulWidget {
  final double speedInKmh;
  const Speedometer(this.speedInKmh);

  @override
  _SpeedometerState createState() => _SpeedometerState();
}

class _SpeedometerState extends State<Speedometer> {
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(
        minimum: 0,
        maximum: 260,
        labelOffset: 30,
        axisLineStyle:
            AxisLineStyle(thicknessUnit: GaugeSizeUnit.factor, thickness: 0.03),
        majorTickStyle:
            MajorTickStyle(length: 6, thickness: 4, color: Colors.white),
        minorTickStyle:
            MinorTickStyle(length: 3, thickness: 3, color: Colors.white),
        axisLabelStyle: GaugeTextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
        ranges: <GaugeRange>[
          GaugeRange(
              startValue: 0,
              endValue: 260,
              sizeUnit: GaugeSizeUnit.factor,
              startWidth: 0.03,
              endWidth: 0.03,
              gradient: SweepGradient(colors: const <Color>[
                Colors.green,
                Colors.yellow,
                Colors.red
              ], stops: const <double>[
                0.0,
                0.4,
                1
              ]))
        ],
        pointers: <GaugePointer>[
          NeedlePointer(
              value: widget.speedInKmh == null ? 0 : widget.speedInKmh,
              needleLength: 0.95,
              enableAnimation: true,
              animationType: AnimationType.ease,
              needleStartWidth: 1.5,
              needleEndWidth: 6,
              needleColor: Colors.red,
              knobStyle: KnobStyle(knobRadius: 0.09))
        ],
      )
    ]);
  }
}
