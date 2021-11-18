import 'package:flutter/cupertino.dart';

class CheckboxState {
  final String title;
  bool value;

  CheckboxState({
    required this.title,
    this.value = false,
  });
}

/*
class listoftodo {
  String message;
  value done or not done;

  listoftodo({this.message, this.done})
}

class MyState extends ChangeNotifier {
  List<listoftodo> _list;

  List<listoftodo> get list => _list;

  void addtodoitem(listobject todoitem) {
    _list.add(todoitem);
    notifyListeners();
  }
}
*/