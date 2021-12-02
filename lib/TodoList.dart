import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Model.dart';

class TodoList extends StatelessWidget {
  final List<Todo> list;

  TodoList(this.list);

  Widget build(BuildContext context) {
    return ListView(
        children:
            list.map((activity) => _activityitem(context, activity)).toList());
  }

  Widget _activityitem(context, activity) {
    var state = Provider.of<Mystate>(context, listen: false);
    return CheckboxListTile(
      title: Text(activity.title,
       style: TextStyle(decoration: activity.done ? TextDecoration.lineThrough : null),
       ), 
      secondary: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          var state = Provider.of<Mystate>(context, listen: false);
          state.remove_activityApi(activity);
        },
      ),
      controlAffinity: ListTileControlAffinity.leading,
      value: activity.done,
      onChanged: (value) {
        state.toggle_ActivityApi(activity);
      },
    );
  }
}