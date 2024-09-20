import 'package:flutter/material.dart';

class Ejercicio03 extends StatefulWidget {
  @override
  _Ejercicio03State createState() => _Ejercicio03State();
}

class _Ejercicio03State extends State<Ejercicio03> {
  final _horasController = TextEditingController();
  final _sueldoController = TextEditingController();
  final _tipoController = TextEditingController();
  String _resultado = '';

  void _calcularPago() {
    int horas = int.tryParse(_horasController.text) ?? 0;
    double sueldoPorHora = double.tryParse(_sueldoController.text) ?? 0.0;
    int tipoTrabajador = int.tryParse(_tipoController.text) ?? 0;

    double pagoBruto = horas * sueldoPorHora;
    double pagoNeto = pagoBruto;

    if (pagoBruto >= 100000) {
      if (tipoTrabajador == 1 || tipoTrabajador == 2) {
        pagoNeto = pagoBruto * 0.90; // Aplicar 10% de impuesto
      }
    }

    setState(() {
      _resultado = 'El pago neto es: $pagoNeto';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio03: Pago de Trabajadores'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _horasController,
              decoration: InputDecoration(labelText: 'Horas trabajadas'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _sueldoController,
              decoration: InputDecoration(labelText: 'Sueldo por hora'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _tipoController,
              decoration: InputDecoration(labelText: 'Tipo de trabajador (1-Obrero, 2-Empleado)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularPago,
              child: Text('Calcular Pago'),
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
