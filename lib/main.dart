import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main()=>runApp(MyApp());
  
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    List color = [Colors.amber, Colors.cyanAccent, Colors.indigo, Colors.pink, Colors.teal];
    Random random = new Random();
    int index = random.nextInt(5);

    final sizedBox = new Container(
      margin: new EdgeInsets.all(5.0),
      height: 600,
      width: 600,
      child: SizedBox(
        child: Card(
            color: color[index],
            child: Center(child: Palabras())
        ),
      ),
    );

    final grid = new StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) => new Container(
          child: new Center(
            child: sizedBox
          )),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(1, 1.60),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );

    return MaterialApp(
      title: "App Jardín",
      home: Scaffold(
        body: grid
      ),
    );
  }
}


class Palabras extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return PalabrasState();
  }
}

class PalabrasState extends State<Palabras>{
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}