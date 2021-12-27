import 'package:flutter/material.dart';

class myTextField extends StatelessWidget {
  final Color color;
  final String hintText;
  final double borderRadius;
  final TextEditingController textEditingController;
  const myTextField({Key? key, required this.color,required this.hintText, required this.borderRadius,required this.textEditingController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      style: TextStyle(color: color),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade600),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
