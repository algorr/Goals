import 'package:flutter/material.dart';

class MySignInButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final Color buttonColor;
  final Color textColor;

  const MySignInButton({Key? key, required this.onTap, required this.text, required this.buttonColor, required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
      decoration: BoxDecoration(
          color: buttonColor, borderRadius: BorderRadius.circular(20)),
      child: TextButton(
          onPressed: () {
            onTap();
          },
          child:  Text(
           text,
            style:  TextStyle(fontFamily: 'NotoSans', color: textColor),
          )),
    );
  }
}
