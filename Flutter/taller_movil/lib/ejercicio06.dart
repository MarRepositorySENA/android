import 'package:flutter/material.dart';

class Ejercicio06 extends StatefulWidget {
  @override
  _Ejercicio06State createState() => _Ejercicio06State();
}

class _Ejercicio06State extends State<Ejercicio06> {
  final _celsiusController = TextEditingController();
  String _resultado = '';

  void _convertirTemperatura() {
    double tempCelsius = double.tryParse(_celsiusController.text) ?? 0.0;
    double tempKelvin = tempCelsius + 273.15;
    double tempFahrenheit = (tempCelsius * 9/5) + 32;

    setState(() {
      _resultado = 'Kelvin: $tempKelvin, Fahrenheit: $tempFahrenheit';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio06: Celsius a Kelvin y Fahrenheit'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _celsiusController,
              decoration: InputDecoration(labelText: 'Temperatura en Celsius'),
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
