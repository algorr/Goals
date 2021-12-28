
import 'package:goals/models/user_model.dart';

abstract class DBBase{
  Future<bool> saveUser(Users user);
  Future<Users> readUser(String userID);
  Future<bool> updateUserName(String userID, String yeniUserName);
  Future<bool> updateProfilFoto(String userID, String profilFotoURL);
  Future<List<Users>> getUserwithPagination(Users enSonGetirilenUser, int getirilecekElemanSayisi);
  Future<DateTime> saatiGoster(String userID);
}