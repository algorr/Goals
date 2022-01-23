

import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository{
  User currentUser();
  Future<void> signIn(String email, String password);
  Future<void> signUp(String email, String password);
  Future<void> signOut();
  Future<void> passwordResetSubmit(String email);
  Future<bool> isFirstRun();
  Future<void> updatePersonalData(
      String firstname, String lastName, String carBrand);
}

class FirebaseAuthRepository extends AuthRepository{
  @override
  User currentUser() {
    // TODO: implement currentUser
    throw UnimplementedError();
  }

  @override
  Future<bool> isFirstRun() {
    // TODO: implement isFirstRun
    throw UnimplementedError();
  }

  @override
  Future<void> passwordResetSubmit(String email) {
    // TODO: implement passwordResetSubmit
    throw UnimplementedError();
  }

  @override
  Future<void> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(String email, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<void> updatePersonalData(String firstname, String lastName, String carBrand) {
    // TODO: implement updatePersonalData
    throw UnimplementedError();
  }

}