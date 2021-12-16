import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goals/pages/goals_page.dart';
import 'package:goals/pages/notification_page.dart';
import 'package:goals/pages/profile_page.dart';
import 'message_page.dart';

class HomePage extends StatefulWidget {
  final Future<User?> user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> tumSayfalar = [];
  int _currentIndex = 0;

  GoalsPage _goalsPage = const GoalsPage();
  NotificationPage _notificationPage = const NotificationPage();
  MessagePage _messagePage = const MessagePage();
  ProfilePage _profilePage = const ProfilePage();

  var keyGoals   = const PageStorageKey('keyGoals');
  var keyNoti    = const PageStorageKey('keyNoti');
  var keyProfile = const PageStorageKey('keyProfile');
  var keyMessage = const PageStorageKey('keyMessage');

  

  PageController? _pageController;

  @override
  void initState() {
    
    super.initState();
    _notificationPage = NotificationPage(
      key: keyNoti,
    );
    _profilePage = ProfilePage(
      key: keyProfile,
    );
    _goalsPage = GoalsPage(
      key: keyGoals,
    );
    _messagePage = MessagePage(
      key: keyMessage,
    );

    tumSayfalar = [_goalsPage, _notificationPage, _messagePage, _profilePage];
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController?.jumpToPage(index);
        },
        items: [
          BottomNavyBarItem(
            icon: const Icon(Icons.home_rounded),
            title: const Text('Home'),
            inactiveColor: Colors.black,
            activeColor: Colors.indigoAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.notifications_rounded),
            title: const Text('Notification'),
            inactiveColor: Colors.black,
            activeColor: Colors.indigoAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.inbox_rounded),
            title: const Text(
              'Messages',
            ),
            inactiveColor: Colors.black,
            activeColor: Colors.indigoAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.person_rounded),
            title: const Text(
              'Profile',
            ),
            inactiveColor: Colors.black,
            activeColor: Colors.indigoAccent,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        children: <Widget>[
          _goalsPage,
          _notificationPage,
          _messagePage,
          _profilePage,
          //Container(color: Colors.blue,),
        ],
      ),
    );
  }
}
