import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goals/services/firebase_auth.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF2d3447),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    //padding: EdgeInsets.only(top: 20),
                    height: size.height * 0.3,
                    width: size.width,
                    child: Image.asset(
                      "assets/images/back1.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.4,
                    top: size.height * 0.25,
                    child: const CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage("assets/images/image_03.jpg",),
                    ),
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
