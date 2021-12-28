
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Users {
  final String userID;

  Users({required this.userID});

  Map<String, dynamic> toMap(){
    return {
      'userID' : userID,
    };
  }
}