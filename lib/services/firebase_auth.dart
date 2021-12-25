import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

enum UserState { signedIn, notSignedIn}

class AuthService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  UserState _userState = UserState.notSignedIn;

  UserState get userState => _userState;

  set userState(UserState value) {
    _userState = value;
    notifyListeners();
  }


  AuthService() {
    _firebaseAuth.authStateChanges().listen(_authStateChanged);
  }



  void _authStateChanged(User? user) {
    if (user == null) {
      userState = UserState.notSignedIn;
    } else {
      userState = UserState.signedIn;
    }
  }

  Future<User?> signUp(String email, String password) async {
    try {
      userState = UserState.notSignedIn;
      UserCredential _credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? _newUser = _credential.user;
      return _newUser;
    } catch (e) {
      userState = UserState.notSignedIn;
      debugPrint("Kullanıcı oluşturma başarısız oldu : " + e.toString());
      return null;
    }
  }

  Future<User?> signIn(String email, String password) async {
    try {
      userState = UserState.signedIn;
      UserCredential _credential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User? _signedInUser = _credential.user;
      return _signedInUser;
    } catch (e) {
      userState = UserState.notSignedIn;
      debugPrint("Kullanıcı oturum açmada sorun oldu : " + e.toString());
      //return null;
    }
  }

  Future<bool> signOut() async{
    try{
      await _firebaseAuth.signOut();
      return true;
    }catch(e){
      debugPrint("Kullanıcı oturum kapama sorun oldu : " + e.toString());
      return false;
    }
  }

  Future<User?> currentUser()async{
    User? user =  _firebaseAuth.currentUser;
    return user;
  }
}
