import 'package:flutter/material.dart';

class Ejercicio05 extends StatefulWidget {
  @override
  _Ejercicio05State createState() => _Ejercicio05State();
}

class _Ejercicio05State extends State<Ejercicio05> {
  final _llantasController = TextEditingController();
  String _resultado = '';

  void _calcularPrecioLlantas() {
    int numLlantas = int.tryParse(_llantasController.text) ?? 0;
    double precioUnitario;
    
    if (numLlantas < 5) {
      precioUnitario = 300;
    } else if (numLlantas <= 10) {
      precioUnitario = 250;
    } else {
      precioUnitario = 200;
    }

    double total = numLlantas * precioUnitario;

    setState(() {
      _resultado = 'El precio total es: \$${total.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio05: Precio de Llantas'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _llantasController,
              decoration: InputDecoration(labelText: 'Número de llantas'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularPrecioLlantas,
              child: Text('Calcular Precio'),
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
