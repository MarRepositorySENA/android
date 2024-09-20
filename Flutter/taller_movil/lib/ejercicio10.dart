import 'package:flutter/material.dart';

class Ejercicio10 extends StatefulWidget {
  @override
  _Ejercicio10State createState() => _Ejercicio10State();
}

class _Ejercicio10State extends State<Ejercicio10> {
  final _numeroController = TextEditingController();
  String _resultado = '';

  void _verificarDigito() {
    int numero = int.tryParse(_numeroController.text) ?? -1;

    if (numero >= 0 && numero <= 9) {
      setState(() {
        _resultado = 'El número es de un dígito.';
      });
    } else {
      setState(() {
        _resultado = 'El número no es de un dígito.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio10: Verificar Dígito'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _numeroController,
              decoration: InputDecoration(labelText: 'Ingresa un número'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _verificarDigito,
              child: Text('Verificar Dígito'),
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
