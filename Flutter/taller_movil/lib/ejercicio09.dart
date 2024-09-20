import 'package:flutter/material.dart';

class Ejercicio09 extends StatefulWidget {
  @override
  _Ejercicio09State createState() => _Ejercicio09State();
}

class _Ejercicio09State extends State<Ejercicio09> {
  final _numeroController = TextEditingController();
  String _resultado = '';

  void _numeroEnLetras() {
    int numero = int.tryParse(_numeroController.text) ?? -1;
    List<String> numerosEnLetras = ['Cero', 'Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco', 'Seis', 'Siete', 'Ocho', 'Nueve'];

    if (numero >= 0 && numero <= 9) {
      setState(() {
        _resultado = 'El número en letras es: ${numerosEnLetras[numero]}';
      });
    } else {
      setState(() {
        _resultado = 'Por favor, ingrese un número de un solo dígito.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio09: Número en Letras'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _numeroController,
              decoration: InputDecoration(labelText: 'Ingresa un número de un dígito'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _numeroEnLetras,
              child: Text('Convertir a Letras'),
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
