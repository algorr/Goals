import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:goals/models/profile_edit_model.dart';

class ProfileEditService with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ProfileEdit> updateProfile(
      String username,
      String profileImage,
      String backgroundImage,
      String linkedinUrl,
      String slackUrl,
      String githubUrl,
      String twitterUrl) async{
    var ref = _firestore.collection("profileInfos");

    profileImage = "bos";
    backgroundImage = "bos";

    var documentref = await ref.add({
      "username": username,
      "profileImage": profileImage,
      "backgroundImage": backgroundImage,
      "linkedinUrl": linkedinUrl,
      "slackUrl": slackUrl,
      "githubUrl": githubUrl,
      "twitterUrl": twitterUrl
    });
    return ProfileEdit(
        id: ref.id,
        username: username,
        profileImage: profileImage,
        backgroundImage: backgroundImage,
        linkedinUrl: linkedinUrl,
        slackUrl: slackUrl,
        githubUrl: githubUrl,
        twitterUrl: twitterUrl);
  }
}
