import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Facilities extends StatelessWidget {
  const Facilities({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: const [
              Icon(
                Icons.sunny_snowing,
                color: Colors.yellow,
                size: 24.0,
              ),
              Text("Sunset View"),
            ],
          ),
          Column(
            children: const [
              Icon(
                Icons.pool,
                color: Colors.blue,
                size: 32.0,
              ),
              Text("Swimming Pool"),
            ],
          ),
          Column(
            children: const [
              Icon(
                Icons.work_outline,
                color: Colors.green,
                size: 36.0,
              ),
              Text("Work Station"),
            ],
          ),
          Column(
            children: const [
              Icon(
                Icons.sports_gymnastics,
                color: Colors.red,
                size: 36.0,
              ),
              Text("Gym   Center"),
            ],
          ),
        ],
      ),
    ]);
  }
}
