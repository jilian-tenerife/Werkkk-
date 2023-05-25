import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

class Card extends StatelessWidget {
  final color;

  Card({required this.color});

  @override
  Widget build(BuildContext context) {
    return Swipable(
      onSwipeRight: ((finalPosition) {
        print("swipable");
      }),
      child: Container(
        color: color,
      ),
    );
  }
}
