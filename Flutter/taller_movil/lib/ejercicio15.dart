import 'package:flutter/material.dart';

class Ejercicio15 extends StatefulWidget {
  @override
  _Ejercicio15State createState() => _Ejercicio15State();
}

class _Ejercicio15State extends State<Ejercicio15> {
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

  void _encontrarMayor() {
    if (_numeros.isNotEmpty) {
      int mayor = _numeros.reduce((a, b) => a > b ? a : b);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text('El mayor número es: $mayor'),
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
          title: Text('Ejercicio15: Mayor de n números'),
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
                    onPressed: _encontrarMayor,
                    child: Text('Encontrar mayor'),
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
