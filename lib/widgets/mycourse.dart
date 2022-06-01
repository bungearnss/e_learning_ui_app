import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyCourse extends StatelessWidget {
  String title;
  String hour;
  double progress;
  Color color;
  double width;

  MyCourse({
    required this.title,
    required this.hour,
    required this.progress,
    required this.color,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 170.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 17.0,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    "$hour hours progress",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 10.0,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  CircularPercentIndicator(
                    radius: 20.0,
                    lineWidth: 8.0,
                    animation: true,
                    percent: progress,
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.white,
                    backgroundColor: Colors.black45,
                  ),
                  const SizedBox(width: 5.0),
                  Text(
                    (progress * 100).toString() + "%",
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
