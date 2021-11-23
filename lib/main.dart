import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_first_app/model.dart';

import './ThirdView.dart';
import './model.dart';
import './TodoList.dart';
import './NewTodo.dart';
import './MainView.dart';

void main() {
  var state = Mystate();

  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: 
        ThemeData(
          primarySwatch: Colors.blueGrey,
          //brightness: Brightness.dark, todo -> dark theme och mysigt:)
      ),
      debugShowCheckedModeBanner: false,
      home: const MainView(),
    );
  }
}





/*void main() {
  runApp(
     MyApp());
    
  
}
class MyApp extends StatelessWidget {
  static final String title = "ToDo TIG169";

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
                child: Text("All"),
              ),
              PopupMenuItem<int>(
                value: 0,
                child: Text("Done"),
              ),
              PopupMenuItem<int>(
                value: 0,
                child: Text("Undone"),
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
                context, MaterialPageRoute(builder: (context) => NewTodo(CheckboxState(title: "input"))));
              },
      
      ),
  );

  Widget buildSingleCheckbox(CheckboxState checkbox) => CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          secondary: Icon(Icons.delete),
          value: checkbox.value,
          title: Text(
            checkbox.title,
            style: TextStyle(fontSize: 22),
            ),
          onChanged: (value) => setState(() {
            checkbox.value = value!;
          }),
        );
}
*/
List<Todo> _filterList(list, value) {
    if (value == 1) return list;
    if (value == 2) {
      return list.where((activity) => activity.klar == true).toList();
    }
    if (value == 3) {
      return list.where((activity) => activity.klar == false).toList();
    }
    return list;
  }


void onSelected(BuildContext context, int item) {
  switch (item) {
    case 0:
      Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainView())
      );
      break;

      /*case 1:
      Navigator.push(
        context, MaterialPageRoute (builder: (context, state) => TodoList(_filterList(state.list, state.filterBy))
      );
      break;
      */
      case 2:
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