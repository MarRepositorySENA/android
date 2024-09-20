import 'package:flutter/material.dart';

class Ejercicio07 extends StatefulWidget {
  @override
  _Ejercicio07State createState() => _Ejercicio07State();
}

class _Ejercicio07State extends State<Ejercicio07> {
  final _kelvinController = TextEditingController();
  String _resultado = '';

  void _convertirTemperatura() {
    double tempKelvin = double.tryParse(_kelvinController.text) ?? 0.0;
    double tempCelsius = tempKelvin - 273.15;
    double tempFahrenheit = (tempCelsius * 9/5) + 32;

    setState(() {
      _resultado = 'Celsius: $tempCelsius, Fahrenheit: $tempFahrenheit';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio07: Kelvin a Celsius y Fahrenheit'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _kelvinController,
              decoration: InputDecoration(labelText: 'Temperatura en Kelvin'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertirTemperatura,
              child: Text('Convertir Temperatura'),
            ),
            SizedBox(height: 20),
            Text(
              _resultado,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
