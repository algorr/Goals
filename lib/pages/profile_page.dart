import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:goals/pages/profile_edit_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final double coverHeight = 280;
  final double profileHeight = 144;

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
        color: Colors.grey,
        child: Image.asset(
          "assets/images/image_01.jpg",
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

  Widget setProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: const AssetImage("assets/images/image_03.jpg"),
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
            setSocialIcon(FontAwesomeIcons.linkedin),
            const SizedBox(
              width: 12,
            ),
            setSocialIcon(FontAwesomeIcons.slack),
            const SizedBox(
              width: 12,
            ),
            setSocialIcon(FontAwesomeIcons.github),
            const SizedBox(
              width: 12,
            ),
            setSocialIcon(FontAwesomeIcons.twitter),
            const SizedBox(
              width: 12,
            ),
          ],
        ),
      ],
    );
  }

  Widget setSocialIcon(IconData icon) {
    return CircleAvatar(
      radius: 25,
      child: Material(
        shape: const CircleBorder(),
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Center(
            child: Icon(
              icon,
              size: 32,
            ),
          ),
        ),
      ),
    );
  }
}
