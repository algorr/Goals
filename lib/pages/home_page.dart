import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:goals/pages/goals_page.dart';
import 'package:goals/pages/notification_page.dart';
import 'package:goals/pages/profile_page.dart';
import 'message_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> tumSayfalar = [];
  int _currentIndex = 0;

  GoalsPage _goalsPage = GoalsPage();
  NotificationPage _notificationPage = NotificationPage();
  MessagePage _messagePage = MessagePage();
  ProfilePage _profilePage = ProfilePage();

  var keyGoals = PageStorageKey('keyGoals');
  var keyNoti = PageStorageKey('keyNoti');
  var keyProfile = PageStorageKey('keyProfile');
  var keyMessage = PageStorageKey('keyMessage');

  //var keyP = PageStorageKey('keyShow');

  PageController? _pageController;

  @override
  void initState() {
    // TODO: implement initState
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
    // TODO: implement dispose
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
            icon: Icon(Icons.home_rounded),
            title: Text('Home'),
            inactiveColor: Colors.black,
            activeColor: Colors.indigoAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.notifications_rounded),
            title: Text('Notification'),
            inactiveColor: Colors.black,
            activeColor: Colors.indigoAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.inbox_rounded),
            title: Text(
              'Messages',
            ),
            inactiveColor: Colors.black,
            activeColor: Colors.indigoAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person_rounded),
            title: Text(
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
