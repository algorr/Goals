import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goals/pages/landing_page.dart';
import 'package:goals/services/firebase_auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(create: (_) { return AuthService(); },
  child: const MyApp()));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<AuthService>(context).currentUser();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home:  LandingPage(user: user,),
    );
  }
}
