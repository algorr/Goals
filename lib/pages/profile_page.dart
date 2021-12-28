import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:goals/pages/profile_edit_page.dart';
import 'package:goals/services/profile_edit_service.dart';
import 'package:goals/widgets/my_social_button.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final double coverHeight = 280;
  final double profileHeight = 144;
  String? linkedinUrl;
  String? slackUrl;
  String? githubUrl;
  String? twitterUrl;


@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.settings,
          size: 25,
        ),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ProfileEditPage()));
        },
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          setTop(),
          const SizedBox(
            height: 80,
          ),
          setContent(),
        ],
      ),
    );
  }

  Widget setCoverImage() => Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.black, spreadRadius: 5),
          ],
        ),
        child: Image.asset(
          "assets/images/image_01.jpg",
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

  Widget setProfileImage() => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.black, spreadRadius: 5)
          ],
        ),
        child: CircleAvatar(
          radius: profileHeight / 2,
          backgroundColor: Colors.grey.shade800,
          backgroundImage: const AssetImage("assets/images/image_03.jpg"),
        ),
      );

  Widget setTop() {
    final top = coverHeight - profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        setCoverImage(),
        Positioned(
          top: top,
          child: setProfileImage(),
        ),
      ],
    );
  }

  Widget setContent() {
    return Column(
      children: [
        const Text(
          "Ümit Kar",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        const Text(
          "Data Scientist",
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Divider(
          thickness: 1,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: setSocialIcon(FontAwesomeIcons.linkedin, () async {
                const url = "https://www.linkedin.com/in/ümit-kar/";
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw "Could not launch $url";
                }
              },32,25),
            ),
            const SizedBox(
              width: 12,
            ),
            setSocialIcon(FontAwesomeIcons.slack, () async {
              const url = "https://slack.com/";
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw "Could not launch $url";
              }
            },32,25),
            const SizedBox(
              width: 12,
            ),
            setSocialIcon(FontAwesomeIcons.github, () async {
              const url = "";
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw "Could not launch $url";
              }
            },32,25),
            const SizedBox(
              width: 12,
            ),
            setSocialIcon(FontAwesomeIcons.twitter, () async {
              const url = "https://twitter.com/kar_umit";
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw "Could not launch $url";
              }
            },32,25),
            const SizedBox(
              width: 12,
            ),
          ],
        ),
      ],
    );
  }
}
