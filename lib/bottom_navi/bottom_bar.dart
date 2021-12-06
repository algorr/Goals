import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  VoidCallback onPressed;
  bool bottomIcons;
  String text;
  IconData? icon;

  BottomBar(
      {Key? key,
      required this.onPressed,
      required this.bottomIcons,
      required this.text,
      this.icon})
      : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onPressed,
        child: widget.bottomIcons == true
            ? Container(
                padding:
                    const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 8),
                decoration: BoxDecoration(
                    color: Colors.indigo.shade100.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    Icon(
                      widget.icon,
                      color: Colors.indigo,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      widget.text,
                      style: const TextStyle(
                          color: Colors.indigo,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            : Icon(widget.icon));
  }
}
