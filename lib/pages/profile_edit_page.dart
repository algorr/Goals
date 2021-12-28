import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:goals/services/profile_edit_service.dart';
import 'package:goals/widgets/my_social_button.dart';
import 'package:goals/widgets/my_text_field.dart';
import 'package:goals/widgets/sign_in_button.dart';

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

  final ProfileEditService _profileEditService = ProfileEditService();

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
                padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    setSocialIcon(Icons.person, () {}, 15, 15),
                    Container(
                      height: 50,
                      width: 300,
                      child: myTextField(
                        textEditingController: usernameController,
                        color: Colors.amberAccent,
                        hintText: "username",
                        borderRadius: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    setSocialIcon(FontAwesomeIcons.linkedin, () {}, 15, 15),
                    Container(
                      height: 50,
                      width: 300,
                      child: myTextField(
                        textEditingController: linkedinUrlController,
                        color: Colors.amberAccent,
                        hintText: "linkedin profile url",
                        borderRadius: 20,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      setSocialIcon(FontAwesomeIcons.slack, () {}, 15, 15),
                      Container(
                        height: 50,
                        width: 300,
                        child: myTextField(
                          textEditingController: slackUrlController,
                          color: Colors.amberAccent,
                          hintText: "slack profile url",
                          borderRadius: 20,
                        ),
                      ),
                    ],
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      setSocialIcon(FontAwesomeIcons.github, () {}, 15, 15),
                      Container(
                        height: 50,
                        width: 300,
                        child: myTextField(
                          textEditingController: githubController,
                          color: Colors.amberAccent,
                          hintText: "github profile url",
                          borderRadius: 20,
                        ),
                      ),
                    ],
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      setSocialIcon(FontAwesomeIcons.twitter, () {}, 15, 15),
                      Container(
                        height: 50,
                        width: 300,
                        child: myTextField(
                          textEditingController: twitterController,
                          color: Colors.amberAccent,
                          hintText: "twitter profile url",
                          borderRadius: 20,
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: MySignInButton(
                  onTap: () {
                    _profileEditService.updateProfile(
                        usernameController.text,
                        "profileImage",
                        "backgroundImage",
                        linkedinUrlController.text,
                        slackUrlController.text,
                        githubController.text,
                        twitterController.text);
                  },
                  text: 'Kaydet',
                  buttonColor: Colors.white,
                  textColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
