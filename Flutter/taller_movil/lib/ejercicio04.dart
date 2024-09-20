import 'package:flutter/material.dart';

class Ejercicio04 extends StatefulWidget {
  @override
  _Ejercicio04State createState() => _Ejercicio04State();
}

class _Ejercicio04State extends State<Ejercicio04> {
  final _computadorasController = TextEditingController();
  String _resultado = '';

  void _calcularDescuento() {
    int numComputadoras = int.tryParse(_computadorasController.text) ?? 0;
    double precioBase = 11000;
    double total;

    if (numComputadoras < 5) {
      total = numComputadoras * precioBase * 0.90; // 10% de descuento
    } else if (numComputadoras < 10) {
      total = numComputadoras * precioBase * 0.80; // 20% de descuento
    } else {
      total = numComputadoras * precioBase * 0.60; // 40% de descuento
    }

    setState(() {
      _resultado = 'El precio total con descuento es: \$${total.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio04: Descuento en Computadoras'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _computadorasController,
              decoration: InputDecoration(labelText: 'Número de computadoras'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularDescuento,
              child: Text('Calcular Descuento'),
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
