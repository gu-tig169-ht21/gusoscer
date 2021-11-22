import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/TodoList.dart';
import 'package:provider/provider.dart';

/*
class CheckboxState {
  final String title;
  bool value;

  CheckboxState({
    required this.title,
    this.value = false,
  }
  );
  
}
*/
class Todo {
  String? title;
  bool done;

  Todo({this.title, this.done = false});

  void toggleDone(Todo uppgift) {
    done = !done;
  }
}

class Mystate extends ChangeNotifier {
  List<Todo> _list = [];
  int _filterBy = 1;

  List<Todo> get list => _list;

  int get filterBy => _filterBy;

  void adduppgift(Todo uppgift) {
    _list.add(uppgift);
    notifyListeners();
  }

  void removeuppgift(Todo uppgift) {
    _list.remove(uppgift);
    notifyListeners();
  }

  void done(Todo uppgift) {
    uppgift.toggleDone(uppgift);
    notifyListeners();
  }

  void setFilterBy(int filterBy) async {
    _filterBy = filterBy;
    notifyListeners();
  }
}


class checkbox extends StatefulWidget {
  const checkbox({Key? key}) : super(key: key);

  @override
  State<checkbox> createState() => checkboxState();
}

class checkboxState extends State<checkbox> {
  bool isChecked = false;



  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (bool? value) {
        //Provider.of<Mystate>(context, listen: false).change(, value);
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
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