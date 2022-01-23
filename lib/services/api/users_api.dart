import 'package:http/http.dart' as http;

class UsersApi {
  static Future getUsers() {
    return http.get(Uri.parse("http://localhost:3000/users"));
  }
}
