import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './Model.dart';

class NewTodo extends StatefulWidget {
  final Todo activity;

  NewTodo(this.activity);

  @override
  State<StatefulWidget> createState() {
    return NewTodoState(activity);
  }
}

class NewTodoState extends State<NewTodo> {
  late String title;

  late TextEditingController textEditingController;

  NewTodoState(Todo activity) {
    this.title = activity.title!;

    textEditingController = TextEditingController();

    textEditingController.addListener(() {
      setState(() {
        title = textEditingController.text;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Activity"),
      ),
      body: Center(
          child: Column(
        children: [
          Container(
            width: 350,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(20, 35, 20, 0),
            child: TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                hintText: "What needs to be done?",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            child: const Text("+ Add activity"),
            onPressed: () {
              Navigator.pop(context, Todo(title: title));
            },
          ),
        ],
      )),
    );
  }
}