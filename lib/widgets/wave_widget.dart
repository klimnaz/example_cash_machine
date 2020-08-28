import 'dart:math';

import 'package:example_cash_machine/configs/size_config.dart';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import '../configs/styles.dart';

class CustomWave extends StatelessWidget {
  final bool rotated;
  final double height;

  const CustomWave({Key key, this.rotated, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      child: Container(
        height: height,
        width: double.infinity,
        child: WaveWidget(
          config: CustomConfig(
            colors: [
              waveColor4,
              waveColor3,
              waveColor2,
              waveColor1,
            ],
            durations: [35000, 19440, 10800, 6000],
            heightPercentages: [0.05, 0.1, 0.15, 0.2],
          ),
          backgroundColor: Colors.transparent,
          size: Size(double.infinity, double.infinity),
          waveAmplitude: 0,
        ),
      ),
      angle: rotated ? pi : 0,
    );
  }
}
