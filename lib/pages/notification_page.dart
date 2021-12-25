import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<String> icons = [
    "assets/images/image_04.jpg",
    "assets/images/image_03.jpg",
    "assets/images/image_02.jpg",
    "assets/images/image_01.jpg",
  ];

  List<String> notificationTexts = [
    "Learn Numpy and Pandas",
    "First Chapter of Data Analysis",
    "Finish all Courses for Data Science",
    "Ready for the Data Science",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: notificationTexts.length,
          itemBuilder: (context, index) => ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(icons[index]),
            ),
            title: Text(notificationTexts[index]),
            subtitle: Text("Important"),
          ),
        ),
      ),
    );
  }
}
