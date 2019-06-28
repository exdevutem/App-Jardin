import 'package:app_jardin/screens/mainscreen.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    return MaterialApp(
      title: "App Jardín",
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen()
      },
    );
  }
}
