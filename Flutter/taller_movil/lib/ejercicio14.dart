import 'package:flutter/material.dart';

class Ejercicio14 extends StatefulWidget {
  @override
  _Ejercicio14State createState() => _Ejercicio14State();
}

class _Ejercicio14State extends State<Ejercicio14> {
  final TextEditingController _controller = TextEditingController();
  List<int> _numeros = [];

  void _agregarNumero() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _numeros.add(int.parse(_controller.text));
        _controller.clear();
      });
    }
  }

  void _encontrarMenor() {
    if (_numeros.isNotEmpty) {
      int menor = _numeros.reduce((a, b) => a < b ? a : b);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text('El menor número es: $menor'),
        ),
      );
    }
  }

  void _reiniciar() {
    setState(() {
      _numeros.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ejercicio14: Menor de n números'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('Números ingresados: $_numeros'),
              TextField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Ingresa un número'),
                keyboardType: TextInputType.number,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _agregarNumero,
                    child: Text('Añadir número'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _encontrarMenor,
                    child: Text('Encontrar menor'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _reiniciar,
                    child: Text('Reiniciar'),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
