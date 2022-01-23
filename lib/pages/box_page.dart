import 'package:flutter/material.dart';
import 'package:goals/pages/messages_page.dart';
import 'package:goals/pages/notification_page.dart';

class BoxPage extends StatelessWidget {
  const BoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("InBox"),
          centerTitle: true,
          backgroundColor: const Color(0xFF2d3447),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.notifications_active_rounded),
            ),
            Tab(icon: Icon(Icons.email_rounded)),
          ]),
        ),
        body: const TabBarView(children: [
          NotificationPage(),
          MessagesPage(),
        ]),
      ),
    );
  }
}
