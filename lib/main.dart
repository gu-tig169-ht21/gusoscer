import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'ToDo',
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: const IconButton(
        //  icon: Icon(Icons.menu),
        //  tooltip: 'Navigation menu',
        //  onPressed: null,
        //),
        title: const Text('ToDo TIG169'),
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
            ],
         ),
          
          /*IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'filter',
            //onPressed: () {
             // Navigator.push(
              //  context, MaterialPageRoute(builder: (context) => SecondView()));
             
              },
          ), */
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(height: 20),
            item('pet cat', false),
            const Divider(),
            item('feed cat', true),
            const Divider(),
            item('annoy cat', true),
            const Divider(),
            item('being nice', false),
            const Divider(),
            item('test', false),
            const Divider(),
            //_checkboxRowFalse(), nice att ha sen
            //_checkboxRowTrue(),
    ],
  )      
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
  }
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
