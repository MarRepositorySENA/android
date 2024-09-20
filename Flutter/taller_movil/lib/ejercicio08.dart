import 'package:flutter/material.dart';

class Ejercicio08 extends StatefulWidget {
  @override
  _Ejercicio08State createState() => _Ejercicio08State();
}

class _Ejercicio08State extends State<Ejercicio08> {
  final _fahrenheitController = TextEditingController();
  String _resultado = '';

  void _convertirTemperatura() {
    double tempFahrenheit = double.tryParse(_fahrenheitController.text) ?? 0.0;
    double tempCelsius = (tempFahrenheit - 32) * 5/9;
    double tempKelvin = tempCelsius + 273.15;

    setState(() {
      _resultado = 'Celsius: $tempCelsius, Kelvin: $tempKelvin';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio08: Fahrenheit a Celsius y Kelvin'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _fahrenheitController,
              decoration: InputDecoration(labelText: 'Temperatura en Fahrenheit'),
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
