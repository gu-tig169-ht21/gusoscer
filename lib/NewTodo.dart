import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model.dart';

class NewTodo extends StatefulWidget {
  final Todo uppgift;

  NewTodo(this.uppgift);

  @override
  State<StatefulWidget> createState() {
    return NewTodoState(uppgift);
  }
}

class NewTodoState extends State<NewTodo> {
  late String title;

  late TextEditingController textEditingController;

  NewTodoState(Todo uppgift) {
    this.title = uppgift.title!; //utropstecken eller ej?

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
            height: 30,
            width: 350,
            padding: EdgeInsets.all(20),
            ),
          TextField(
            controller: textEditingController,
            decoration: const InputDecoration(
              hintText: "What needs to be done?",
              border: OutlineInputBorder(),
            ),
          ),
          Container(height: 30),
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
  Widget squareContainer(double height) {
    return Container(
      padding: EdgeInsets.all(20),
      width: 350,
      height: height,
      margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
      decoration: BoxDecoration(
        //color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 1, color: Colors.grey),
        ),
        child: TextField(decoration: InputDecoration(hintText: "What are you going to do?"),
        )
      
    );
  }

