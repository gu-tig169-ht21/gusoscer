import 'package:flutter/material.dart';
import 'package:my_first_app/Model.dart';
import './Model.dart';
import './main.dart';
import './TodoList.dart';

/*
class ThirdView extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Add activity'),
        ),
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _square(70),
              TextButton(
                  child: Text("Add activity \n          +"),
                  onPressed: () {
                    //CheckboxState.add(notifications(title: "usr input"));

                    Navigator.pop(context);
                  },
                ),
                Icon(Icons.add),
              //TextField(decoration: InputDecoration(hintText: "What are you going to do?"),),
            ],
            ),
          ),
        );
    }
  }
*/

Widget _square(double height) {
    return Container(
      padding: EdgeInsets.all(20),
      width: 350,
      height: height,
      margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
      decoration: BoxDecoration(
        //color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 2, color: Colors.black),),
        child: TextField(decoration: InputDecoration(hintText: "What are you going to do?"),)
      
    );
  }

/*
class NewTodo extends StatefulWidget {
  final CheckboxState uppgift;

  NewTodo(this.uppgift);

  @override
  State<StatefulWidget> createState() {
    return NewTodoState(uppgift);
  }
}

class NewTodoState extends State<NewTodo> {
  late String message;

  late TextEditingController textEditingController;

  NewTodoState(Todo uppgift) {
    this.message = uppgift.message;

    textEditingController = TextEditingController();

    textEditingController.addListener(() {
      setState(() {
        message = textEditingController.text;
      });
    });
  }

Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIG169 TODO"),
      ),
      body: Center(
          child: Column(
        children: [
          Container(
            height: 30),
          TextField(
            controller: textEditingController),
          Container(height: 30),
          ElevatedButton(
            child: const Text("+ ADD"),
            onPressed: () {
              Navigator.pop(context, Todo(message: message));
            },
          ),
        ],
      )),
    );
  }
}
*/