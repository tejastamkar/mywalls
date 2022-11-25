import 'package:flutter/foundation.dart';
import 'package:mywalls/main.dart';
import 'package:mywalls/model/users.dart';
import 'package:http/http.dart' as http;

class RestApiCalls {
  static String baseUrl = 'https://mycrud-flask.herokuapp.com';
  static String usersEndpoint = 'users';
  static String userEndpoint = 'user';
  Future addDoc({required String name, required String age}) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/$usersEndpoint/$collectionName"),
        body: {'username': name, 'age': age},
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return response.body;
      } else {
        return "Something Went Wrong";
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return "Something Went Wrong";
    }
  }

  Future getUsers() async {
    try {
      final response =
          await http.get(Uri.parse("$baseUrl/$usersEndpoint/$collectionName"));
      List<UserModel> _model = decodeUserModel(response.body);
      return _model;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }

  Future getUser({required String id}) async {
    try {
      final response = await http
          .get(Uri.parse("$baseUrl/$userEndpoint/$collectionName/$id"));
      List<UserModel> _model = decodeUserModel(response.body);
      return _model;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }

  Future updateDoc(
      {required String name, required String age, required String id}) async {
    try {
      final response = await http.put(
        Uri.parse("$baseUrl/$userEndpoint/$collectionName/$id"),
        body: {'username': name, 'age': age},
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return response.body;
      } else {
        return "Something Went Wrong";
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return "Something Went Wrong";
    }
  }

  Future deleteUser({required String id}) async {
    try {
      final response = await http
          .delete(Uri.parse("$baseUrl/$userEndpoint/$collectionName/$id"));

      if (response.statusCode == 201 || response.statusCode == 200) {
        return response.body;
      } else {
        return "Something Went Wrong";
      }
    } catch (e) {
      return "Something Went Wrong";
    }
  }
}
