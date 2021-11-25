import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/TodoList.dart';
import 'package:provider/provider.dart';
import './Network.dart';

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
  String id;
  String? title;
  bool done;

  Todo({this.id = '', this.title, this.done = false});

  void toggleDone(Todo activity) {
    done = !done;
  }

  static Map<String, dynamic> toJson(Todo activity) {
    return {
      'title': activity.title, //behöver inte va message?
      'done': (activity.done), //behöver fixas? tror http går med på bool så behövs ingen ny metod?
    };
  }

  static Todo fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      done: json['done']  //stringToColor(json['color']), //kanske får göra en funktion som gör bool to string?
      
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
  /*
  void add_activity(Todo activity) {
    _list.add(activity);
    notifyListeners();
  }
*/
  void add_activityApi(Todo activity) async {
    _list = await Api.add_activityApi(activity);
    notifyListeners();
  }
/*
  void remove_activity(Todo activity) {
    _list.remove(activity);
    notifyListeners();
  }
*/
  void remove_activityApi(Todo activity) async {
    _list = await Api.delete_ActivityApi(activity.id);
    notifyListeners();
  }

  void toggle_ActivityApi(Todo activity) async {
    activity.toggleDone(activity);
    _list = await Api.put_ActivityApi(activity);
    notifyListeners();
  }
/*
  void done(Todo activity) {        //gör samma funktion fast med api -> gör liknande funktion i network som delete 
    activity.toggleDone(activity);  //-> lägga till i get_listApi if true toggleDone
    notifyListeners();
  }
*/
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