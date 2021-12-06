import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("username"),
        centerTitle: true,
        //leading: Text("username",style: TextStyle(color: Colors.white),),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.settings)),
          ],),
        ],
      ),
    );
  }
}
