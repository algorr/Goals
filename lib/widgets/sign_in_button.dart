import 'package:flutter/material.dart';

class MySignInButton extends StatelessWidget {
  final Function onTap;

  const MySignInButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
      decoration: BoxDecoration(
          color: Colors.grey[850], borderRadius: BorderRadius.circular(20)),
      child: TextButton(
          onPressed: () {
            onTap();
          },
          child: const Text(
            'Sign In',
            style: TextStyle(fontFamily: 'NotoSans', color: Colors.white),
          )),
    );
  }
}
