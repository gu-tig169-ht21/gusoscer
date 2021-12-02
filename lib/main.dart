import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Model.dart';
import './MainView.dart';

void main() {
  var state = Mystate();
  state.getList();

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
          primarySwatch: Colors.green,
          accentColor: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: const MainView(),
    );
  }
}
