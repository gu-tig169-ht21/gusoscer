import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './Network.dart';

class Todo {
  String id;
  String? title;
  bool done;

  Todo({this.id = '', this.title, this.done = false});

  void toggleDone(Todo activity) {
    done = !done;
  }

  static Map<String, dynamic> toJson(Todo activity) {
    return {
      'title': activity.title, 
      'done': (activity.done),
    };
  }

  static Todo fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      done: json['done'] 
    );
  }
}

class Mystate extends ChangeNotifier {
  List<Todo> _list = [];
  int _filterBy = 1;

  List<Todo> get list => _list;

  int get filterBy => _filterBy;

  Future getList() async {
    List<Todo> list = await Api.getActivitesApi();
    _list = list;
    notifyListeners();
  }
 
  void add_activityApi(Todo activity) async {
    _list = await Api.add_activityApi(activity);
    notifyListeners();
  }

  void remove_activityApi(Todo activity) async {
    _list = await Api.delete_ActivityApi(activity.id);
    notifyListeners();
  }

  void toggle_ActivityApi(Todo activity) async {
    activity.toggleDone(activity);
    _list = await Api.put_ActivityApi(activity);
    notifyListeners();
  }

  void setFilterBy(int filterBy) async {
    _filterBy = filterBy;
    notifyListeners();
  }
}
