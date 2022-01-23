import 'package:http/http.dart' as http;

class GoalsApi {
  static Future getGoals() {
    return http.get(Uri.parse("http://localhost:3000/users"));
  }
}
