import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prueba_antpack/models/User.dart';

class UserService {
  final String _apiUrl = 'jsonplaceholder.typicode.com';

  UserService();

  List<User> _usersFromApi(http.Response response) {
    List<dynamic> data = jsonDecode(response.body);
    print('data');
    print(data[1]['id']);
    return [for (var user in data) User.fromMap(user)];
  }

  Stream<List<User>> fetchData() {
    return http.get(Uri.https(_apiUrl, 'users')).asStream().map(_usersFromApi);
  }
}
