import 'package:app_jardin/widgets/sensorcard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget{ 
  @override
  Widget build(BuildContext context){
    List<List <Color>> colores=[
      [Color(0xFFFFC371), Color(0xFFFF5F6D)],
      [Color(0xFFffe259), Color(0xFFffa751)],
      [Color(0xFF00d2ff), Color(0xFF3a7bd5)],
      [Color(0xFF38ef7d), Color(0xFF11998e)]];
    List<IconData> iconos=[FontAwesomeIcons.thermometerHalf, Icons.lightbulb_outline, FontAwesomeIcons.cloudRain, FontAwesomeIcons.tint];
    List palabras = ["Temperatura", "Iluminación", "Lluvia", "Humedad"];

    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraint) {
            return new GridView.builder(
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: constraint.maxWidth / constraint.maxHeight,
              ),
              itemBuilder: (context, index) {
                return SensorCard(
                  color: colores[index],
                  icono: iconos[index],
                  texto: palabras[index],
                  tipo: "temperatura"
                );
              },
            );
          },
        ),
      )
    );
  }
}