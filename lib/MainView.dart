import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './TodoList.dart';
import './NewTodo.dart';
import 'model.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo TIG169"),
        centerTitle: true,
        actions: [
          PopupMenuButton(
              onSelected: (int value) {
                Provider.of<Mystate>(context, listen: false).setFilterBy(value);
              },
              itemBuilder: (context) => [
                    const PopupMenuItem(child: Text('All'), value: 1),
                    const PopupMenuItem(child: Text('Done'), value: 2),
                    const PopupMenuItem(child: Text('NotDone'), value: 3),
                  ]),
        ],
      ),
      body: Consumer<Mystate>(
          builder: (context, state, child) =>
              TodoList(_filterList(state.list, state.filterBy))),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          var nyactivity = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewTodo(Todo(title: "Empty ToDo"))),
          );
          if (nyactivity != null) {
            Provider.of<Mystate>(context, listen: false).add_activity(nyactivity);
          }
        },
      ),
    );
  }

  List<Todo> _filterList(list, value) {
    if (value == 1) return list;
    if (value == 2) {
      return list.where((activity) => activity.done == true).toList();
    }
    if (value == 3) {
      return list.where((activity) => activity.done == false).toList();
    }
    return list;
  }
}