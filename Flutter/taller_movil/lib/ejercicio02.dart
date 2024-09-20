import 'package:flutter/material.dart';

class Ejercicio02 extends StatefulWidget {
  @override
  _Ejercicio02State createState() => _Ejercicio02State();
}

class _Ejercicio02State extends State<Ejercicio02> {
  final _numeroController = TextEditingController();
  String _resultado = '';

  void _calcularValorAbsoluto() {
    double numero = double.tryParse(_numeroController.text) ?? 0.0;
    double valorAbsoluto = numero.abs();

    setState(() {
      _resultado = 'El valor absoluto es: $valorAbsoluto';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio02: Valor Absoluto'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _numeroController,
              decoration: InputDecoration(labelText: 'Ingresa un número real'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularValorAbsoluto,
              child: Text('Calcular Valor Absoluto'),
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
