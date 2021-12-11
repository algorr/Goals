import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goals/services/firebase_auth.dart';

enum ViewState {Idle,Busy}

class UserModel with ChangeNotifier implements AuthService{

  ViewState _state = ViewState.Idle;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? _user;

  ViewState get state => _state;

  set state(ViewState value){
    _state = value;
    notifyListeners();
  }


  @override
  Future<User?> signIn(String email, String password) {
    
    throw UnimplementedError();
  }

  @override
  Future<User?> signUp(String email, String password) {
    
    throw UnimplementedError();
  }

  @override
  Future<User?> isCurrentUser() async{
    try{
      state = ViewState.Busy;
      _user = await _firebaseAuth.currentUser;
      return _user;
    }catch (e){
      debugPrint("viewmodeldeki current user hata:" + e.toString());
      return null;
    }finally{
      state = ViewState.Idle;
    }
  }

}