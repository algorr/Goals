import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileEdit {
  String id;
  String username;
  String? profileImage;
  String? backgroundImage;
  String? linkedinUrl;
  String? slackUrl;
  String? githubUrl;
  String? twitterUrl;

  ProfileEdit(
      {required this.id,
      required this.username,
      this.profileImage,
      this.backgroundImage,
      this.linkedinUrl,
      this.slackUrl,
      this.githubUrl,
      this.twitterUrl});

  factory ProfileEdit.fromSnapshot(DocumentSnapshot snapshot) {
    return ProfileEdit(
      id: snapshot.id,
      username: snapshot["username"],
      profileImage: snapshot["profileImage"],
      backgroundImage: snapshot["backgroundImage"],
      linkedinUrl: snapshot["linkedinUrl"],
      slackUrl: snapshot["slackUrl"],
      githubUrl: snapshot["githubUrl"],
      twitterUrl: snapshot["twitterUrl"],
    );
  }
}
