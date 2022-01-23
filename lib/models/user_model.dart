class Users {
  String? userID;
  String? name;
  String? surname;
  String? proffession;
  String? linkedinUrl;
  String? photoUrl;
  String? backPhotoUrl;

  Users(
      {this.userID,
      this.name,
      this.surname,
      this.proffession,
      this.linkedinUrl,
      this.photoUrl,
      this.backPhotoUrl});

  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'name': name,
      'surname': surname,
      'profession': proffession,
      'linkedinUrl': linkedinUrl,
      'photoUrl': photoUrl,
      'backPhotoUrl': backPhotoUrl
    };
  }

  Users.fromJson(Map json) {
    userID = json["userID"];
    name = json["name"];
    surname = json["surname"];
    proffession = json["profession"];
    linkedinUrl = json["linkedinUrl"];
    photoUrl = json["photoUrl"];
    backPhotoUrl = json["backPhotoUrl"];
  }
}
