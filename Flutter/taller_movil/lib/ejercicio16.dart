import 'package:flutter/material.dart';

class Ejercicio16 extends StatefulWidget {
  @override
  _Ejercicio16State createState() => _Ejercicio16State();
}

class _Ejercicio16State extends State<Ejercicio16> {
  final TextEditingController _controller = TextEditingController();
  List<double> _montos = [];

  void _agregarMonto() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _montos.add(double.parse(_controller.text));
        _controller.clear();
      });
    }
  }

  void _calcularTotal() {
    double total = _montos.fold(0, (sum, item) => sum + item);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('El total cobrado es: \$${total.toStringAsFixed(2)}'),
      ),
    );
  }

  void _reiniciar() {
    setState(() {
      _montos.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ejercicio16: Total cobrado en un día'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('Montos ingresados: $_montos'),
              TextField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Ingresa el monto cobrado'),
                keyboardType: TextInputType.number,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _agregarMonto,
                    child: Text('Añadir monto'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _calcularTotal,
                    child: Text('Calcular total'),
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
