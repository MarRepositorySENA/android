import 'package:flutter/material.dart';

class Ejercicio11 extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 11: Vocal o No Vocal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Ingresa un carácter'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String input = _controller.text.toLowerCase();
                if (input.isNotEmpty && input.length == 1) {
                  String result = 'aeiou'.contains(input)
                      ? 'Es una vocal'
                      : 'No es una vocal';
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: Text(result),
                    ),
                  );
                }
              },
              child: Text('Verificar'),
            ),
          ],
        ),
      ),
    );
  }
}
