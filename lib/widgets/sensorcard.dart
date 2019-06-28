import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:http/http.dart' as http;

class SensorCard extends StatefulWidget{
  const SensorCard({
    Key key,
    this.icono,
    this.texto,
    this.color,
    this.tipo,
  }):super(key: key);

  final IconData icono;
  final String texto, tipo;
  final List<Color> color;

  @override
  _SensorCardState createState() => _SensorCardState();
}

class _SensorCardState extends State<SensorCard> {
  Timer timer;
  String valor;

  @override
  void initState(){
    super.initState();
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => getValor());
  }

  @override
  void dispose(){
    timer?.cancel();
    super.dispose();
  }

  Future<String> getValor() async{
    String tipo = widget.texto.toLowerCase().replaceAll("ó", "o");
    String url = 'https://things.ubidots.com/api/v1.6/devices/jardin-colgante/${widget.tipo}/lv';
    final response = await http.get(
      url,
      headers: {
        "X-Auth-Token": "A1E-OBmokMwoXK7GWPLpCbwgHcrZs0uZA5"
      });

    setState(() {
      valor = response.body;
    });

    return response.body;
  }
  

  @override
  Widget build(BuildContext context){
    return GradientCard(
      gradient: LinearGradient(
        colors: widget.color,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              widget.icono,
              color: Colors.white,
              size: 90
            ),
            Text(
              widget.texto,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              valor,
              style: TextStyle(
                fontSize: 40,
                color: Colors.white
              ),
              textAlign: TextAlign.center,
            )
          ],
        )
      ),
    );
  }
}