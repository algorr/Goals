import 'package:flutter/material.dart';

class OthersPage extends StatefulWidget {
  const OthersPage({Key? key}) : super(key: key);

  @override
  _OthersPageState createState() => _OthersPageState();
}

class _OthersPageState extends State<OthersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2d3447),
        leading: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/image_03.jpg"),
          ),
        ),
        title: const Text("Others"),
        centerTitle: true,
        leadingWidth: 45,

      ),
    );
  }
}
