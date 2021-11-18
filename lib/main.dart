import 'package:flutter/material.dart';
import 'package:my_first_app/model.dart';

void main() {
  runApp(
     MyApp());
    
  
}
class MyApp extends StatelessWidget {
  static final String title = "checkbox list";

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    home: MainPage(),
    );
}
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();

  
}
class _MainPageState extends State<MainPage> {
  //bool value = false;

  final notifications = [
    CheckboxState(title: "test"),
    CheckboxState(title: "cat"),
    CheckboxState(title: "nice"),
  ];

  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("ToDo TIG169"),
      //centerTitle: true,
      actions: [
          PopupMenuButton<int>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                child: Text("all"),
              ),
              PopupMenuItem<int>(
                value: 0,
                child: Text("done"),
              ),
              PopupMenuItem<int>(
                value: 0,
                child: Text("undone"),
              ),
            ]
          ),
            ]
    ),
      body: ListView(
      padding: EdgeInsets.all(12),
      children: [
        ...notifications.map(buildSingleCheckbox).toList(),
        
      ],
      
    ),
    floatingActionButton: FloatingActionButton(
        tooltip: 'Add activity', 
        child: Icon(Icons.add),
        onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => ThirdView()));
              },
      
      ),
  );

  Widget buildSingleCheckbox(CheckboxState checkbox) => CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          value: checkbox.value,
          title: Text(
            checkbox.title,
            style: TextStyle(fontSize: 20),
            ),
          onChanged: (value) => setState(() {
            checkbox.value = value!;
          }),
        );
}



void onSelected(BuildContext context, int item) {
  switch (item) {
    case 0:
      Navigator.push(
        context, MaterialPageRoute(builder: (context) => SecondView())
      );
      break;
  }
}

Widget item(String toDo, bool done) {
    return ListTile(
      leading: Checkbox(
        value: done,
        onChanged: (val) {},
      ),
      title: Text(toDo, style: _textstyle(done)),
      trailing: Icon(Icons.delete),
    );
  }

  TextStyle _textstyle(done) {
    if (done) 
      return TextStyle(fontSize: 22, decoration: TextDecoration.lineThrough);
    else 
      return TextStyle(fontSize: 22);
    
  }

  class SecondView extends StatelessWidget {
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(),
        body: _list(),
          
        
        
        
        );
    }
  }

  Widget _list() {
    return ListView(
      children: [
        _items('All'),
        _items("Done"),
        _items("notDone"),
      ],
    );
  }

  Widget _items(text){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text, style: TextStyle(fontSize: 16)),
    );
  }

  class ThirdView extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('ToDo TIG169'),
        ),
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _square(70),
              //TextField(decoration: InputDecoration(hintText: "What are you going to do?"),),
              Container(
                margin: EdgeInsets.only(top: 26),
                child: Text("Add activity"),
                ),
                Icon(Icons.add),
                
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

  Widget _checkboxRowFalse() {
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (val) {},
        ),
        Text("pet cat again"),
      ],
    );
  }
  Widget _checkboxRowTrue() {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (val) {},
        ),
        Text("pet cat again nicely"),
      ],
    );
  }