

import 'package:get_it/get_it.dart';
import 'package:goals/services/firebase_auth.dart';
import 'package:goals/services/firebase_storage_service.dart';
import 'package:goals/services/firestore_db_service.dart';

GetIt locator = GetIt.I;

void setupLocator(){
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => FirestoreDbService());
  locator.registerLazySingleton(() => FirebaseStorageService());
}
