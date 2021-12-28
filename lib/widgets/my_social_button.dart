import 'package:flutter/material.dart';

Widget setSocialIcon(IconData icon, Function onPress) {
  return CircleAvatar(
    radius: 25,
    child: Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onPress(),
        child: Center(
          child: Icon(
            icon,
            size: 32,
          ),
        ),
      ),
    ),
  );
}