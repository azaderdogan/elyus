import 'dart:convert';
import 'package:chat_new/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  final String url = "https://mocki.io/v1/9bfc8a97-01f9-420d-afcf-2d8902885cc9";
  Future<UsersModel?> fetchUsers() async {
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var jsonBody = UsersModel.fromJson(jsonDecode(res.body));
      return jsonBody;
    } else {
      print("İstek başarısız oldu => ${res.statusCode}");
    }
  }
}
