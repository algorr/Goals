import 'package:flutter/material.dart';

Widget setSocialIcon(IconData icon, Function onPress, double iconSize, double circleRadius) {
  return CircleAvatar(
    radius: circleRadius,
    child: Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onPress(),
        child: Center(
          child: Icon(
            icon,
            size: iconSize,
          ),
        ),
      ),
    ),
  );
}