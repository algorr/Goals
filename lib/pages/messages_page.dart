import 'package:flutter/material.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  List<String> icons = [
    "assets/images/image_02.jpg",
    "assets/images/image_01.jpg",
    "assets/images/image_04.jpg",
    "assets/images/image_03.jpg",
  ];

  List<String> notificationTexts = [
    "Finish all Courses for Data Science",
    "Ready for the Data Science",
    "Learn Numpy and Pandas",
    "First Chapter of Data Analysis",
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
            subtitle: const Text("Important"),
            trailing: const Icon(Icons.email_rounded),
          ),
        ),
      ),
    );
  }
}
