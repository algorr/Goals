import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:goals/models/user_model.dart';
import 'package:goals/services/database_base.dart';

class FirestoreDbService implements DBBase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<bool> saveUser(Users user) async {
    DocumentSnapshot _readUser =
        await FirebaseFirestore.instance.doc("users/${user.userID}").get();
    if (_readUser.data() == null) {
      await _firestore.collection("users").doc(user.userID).set(user.toJson());
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<List<Users>> getUserwithPagination(
      Users enSonGetirilenUser, int getirilecekElemanSayisi) {
    // TODO: implement getUserwithPagination
    throw UnimplementedError();
  }

  @override
  Future<Users> readUser(String userID) {
    // TODO: implement readUser
    throw UnimplementedError();
  }

  @override
  Future<DateTime> saatiGoster(String userID) {
    // TODO: implement saatiGoster
    throw UnimplementedError();
  }

  @override
  Future<bool> updateProfilFoto(String userID, String profilFotoURL) {
    // TODO: implement updateProfilFoto
    throw UnimplementedError();
  }

  @override
  Future<bool> updateUserName(String userID, String yeniUserName) {
    // TODO: implement updateUserName
    throw UnimplementedError();
  }
}
