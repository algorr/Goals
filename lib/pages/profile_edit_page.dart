import 'package:flutter/material.dart';
import 'package:goals/services/profile_edit_service.dart';
import 'package:goals/widgets/my_text_field.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  late TextEditingController usernameController;
  late TextEditingController linkedinUrlController;
  late TextEditingController slackUrlController;
  late TextEditingController githubController;
  late TextEditingController twitterController;

  ProfileEditService _profileEditService = ProfileEditService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernameController = TextEditingController();
    linkedinUrlController = TextEditingController();
    slackUrlController = TextEditingController();
    githubController = TextEditingController();
    twitterController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2d3447),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2d3447),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Let's Edit Profile",
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Dongle',
              fontSize: 35,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
                child: myTextField(
                  textEditingController: usernameController,
                  color: Colors.amberAccent,
                  hintText: "username",
                  borderRadius: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 50, left: 50),
                child: myTextField(
                  textEditingController: linkedinUrlController,
                  color: Colors.amberAccent,
                  hintText: "linkedin profile url",
                  borderRadius: 20,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20, right: 50, left: 50),
                  child: myTextField(
                    textEditingController: slackUrlController,
                    color: Colors.amberAccent,
                    hintText: "slack profile url",
                    borderRadius: 20,
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 20, right: 50, left: 50),
                  child: myTextField(
                    textEditingController: githubController,
                    color: Colors.amberAccent,
                    hintText: "github profile url",
                    borderRadius: 20,
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 20, right: 50, left: 50),
                  child: myTextField(
                    textEditingController: twitterController,
                    color: Colors.amberAccent,
                    hintText: "twitter profile url",
                    borderRadius: 20,
                  )),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    fixedSize: const Size.square(20),
                    backgroundColor: Colors.amberAccent,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    _profileEditService.updateProfile(
                        usernameController.text,
                        "profileImage",
                        "backgroundImage",
                        linkedinUrlController.text,
                        slackUrlController.text,
                        githubController.text,
                        twitterController.text);
                  },
                  child: Text("Yükle",style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
