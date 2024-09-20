import 'package:flutter/material.dart';

class Ejercicio12 extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 12: Romano a Decimal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Ingresa un número romano (I, V, X, L, C, D, M)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String roman = _controller.text.toUpperCase();
                int decimal = _romanToDecimal(roman);
                String result = decimal != -1
                    ? 'El valor en decimal es $decimal'
                    : 'No es un número romano válido';
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text(result),
                  ),
                );
              },
              child: Text('Convertir'),
            ),
          ],
        ),
      ),
    );
  }

  int _romanToDecimal(String roman) {
    Map<String, int> romanMap = {
      'I': 1,
      'V': 5,
      'X': 10,
      'L': 50,
      'C': 100,
      'D': 500,
      'M': 1000
    };

    int decimal = 0;
    for (int i = 0; i < roman.length; i++) {
      if (i > 0 && romanMap[roman[i]]! > romanMap[roman[i - 1]]!) {
        decimal += romanMap[roman[i]]! - 2 * romanMap[roman[i - 1]]!;
      } else {
        decimal += romanMap[roman[i]]!;
      }
    }

    return decimal;
  }
}
