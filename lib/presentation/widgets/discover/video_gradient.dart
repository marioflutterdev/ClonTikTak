import 'package:flutter/material.dart';

class VideoGradient extends StatelessWidget {
  final List<Color> colors;
  final List<double> stops;

  const VideoGradient(
      {super.key,
      this.colors = const [
        Colors.transparent,
        Colors.black87,
      ],
      this.stops = const [0.8, 1.0]});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: colors,
            stops: stops,
          ),
        ),
      ),
    );
  }
}
