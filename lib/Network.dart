import './Model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const API_KEY = 'e83d76d4-b80b-448a-9a4c-3881b86c1c24';
const API_URL = 'https://todoapp-api-pyq5q.ondigitalocean.app';

class Api {
  static Future<List<Todo>> add_activityApi(Todo activity) async {
    try {
      Map<String, dynamic> json = Todo.toJson(activity);
      var bodyString = jsonEncode(json);
      var response = await http.post(
        Uri.parse('$API_URL/todos?key=$API_KEY'),
        body: bodyString,
        headers: {'Content-Type': 'application/json'},
      );
      bodyString = response.body;
      var list = jsonDecode(bodyString);

      return list.map<Todo>((data) {
        return Todo.fromJson(data);
      }).toList();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static Future delete_ActivityApi(String activityId) async {
    var response = await http.delete(
        Uri.parse('$API_URL/todos/$activityId?key=$API_KEY&_confirm=true'));
    var bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<Todo>((data) {
      return Todo.fromJson(data);
    }).toList();
  }

  static Future put_ActivityApi(Todo activity) async {
    Map<String, dynamic> json = Todo.toJson(activity);
    var bodyString = jsonEncode(json);
    var activityId = activity.id;
    var response = await http.put(
      Uri.parse('$API_URL/todos/$activityId?key=$API_KEY'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
    bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<Todo>((data) {
      return Todo.fromJson(data);
    }).toList();
  }

  static Future<List<Todo>> getActivitesApi() async {
    var response = await http.get(Uri.parse('$API_URL/todos?key=$API_KEY'),
        headers: {'Content-Type': 'application/json'}
    );
    var bodyString = response.body;
    var json = jsonDecode(bodyString);

    return json.map<Todo>((data) {
      return Todo.fromJson(data);
    }).toList();
  }
}

