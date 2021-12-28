import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:goals/pages/landing_page.dart';
import 'package:goals/services/firebase_auth.dart';
import 'package:goals/widgets/sign_in_button.dart';
import 'package:goals/widgets/sign_up_button.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isPasswordVisible = true;
  Color colorOfIcon = Colors.grey;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final myAuth = Provider.of<AuthService>(context);
    return Scaffold(

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
                child: Center(
                    child: Image.asset(
                  'assets/images/goal.png',
                  width: 200,
                  height: 200,
                )),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15),
                child: const Text(
                  "Goals",
                  style: TextStyle(
                      fontSize: 25,
                      //fontWeight: FontWeight.bold,
                      fontFamily: 'Yuji'),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 25),
                child: const Center(
                    child: Text(
                  "Feel comfortable for your conversations in secure and enjoy the short voice messages",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Yuji',
                    fontSize: 17,
                  ),
                )),
              ),
              Container(
                padding: const EdgeInsets.only(top: 30, right: 50, left: 50),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'email',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  controller: emailController,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, right: 50, left: 50),
                //height: 70,
                child: TextField(
                  controller: passwordController,
                  obscureText: isPasswordVisible,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'password',
                    hintStyle: const TextStyle(fontFamily: 'Yuji'),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                            if (isPasswordVisible == true) {
                              colorOfIcon = Colors.grey;
                            } else {
                              colorOfIcon = Colors.blue;
                            }
                          });
                        },
                        icon: Icon(
                          Icons.visibility,
                          color: colorOfIcon,
                        ),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: MySignInButton(
                  onTap: () async {
                    myAuth.signIn(
                        emailController.text, passwordController.text);
                    return (emailController.text.isEmpty ||
                            passwordController.text.isEmpty)
                        ? Fluttertoast.showToast(
                            msg: "Check Email and Password",
                            toastLength: Toast.LENGTH_LONG,
                            backgroundColor: Colors.black,
                            gravity: ToastGravity.CENTER,
                            textColor: Colors.white,
                            fontSize: 16
                          )
                        : LandingPage(user: myAuth.currentUser());
                  },
                   text: 'Sign In', buttonColor: Colors.grey.shade800, textColor: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: MySignUpButton(
                  onTap: () async {
                    myAuth.signUp(
                        emailController.text, passwordController.text);
                    return LandingPage(
                      user: myAuth.currentUser(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
