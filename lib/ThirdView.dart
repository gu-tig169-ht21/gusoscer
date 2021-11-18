import 'package:flutter/material.dart';

class ThirdView extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Add activity'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _square(70),
              //TextField(decoration: InputDecoration(hintText: "What are you going to do?"),),
              Container(
                margin: EdgeInsets.only(top: 26),
                
                child: Text("Add activity"),
                /*TextButton(
                  child: Text("Add activity"),
                  onPressed: () {
                    Navigator.pop()
                  },*/
                )
            
            ,
                
                Icon(Icons.add),
                Icon(Icons.dangerous),
                Icon(Icons.delete),
                Icon(Icons.delete_outline),
                Icon(Icons.add_alarm),
            ],
            ),
          ),
        );
    }
  }

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