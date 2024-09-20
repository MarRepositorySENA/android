import 'package:flutter/material.dart';

class Ejercicio01 extends StatefulWidget {
  @override
  _Ejercicio01State createState() => _Ejercicio01State();
}

class _Ejercicio01State extends State<Ejercicio01> {
  final _diaSemanaController = TextEditingController();
  final _diaMesController = TextEditingController();
  final _mesController = TextEditingController();

  String _resultado = '';

  void _calcularFechaEnPalabras() {
    int diaSemana = int.tryParse(_diaSemanaController.text) ?? 0;
    int diaMes = int.tryParse(_diaMesController.text) ?? 0;
    int mes = int.tryParse(_mesController.text) ?? 0;

    if (diaSemana < 1 || diaSemana > 7 || diaMes < 1 || diaMes > 31 || mes < 1 || mes > 12) {
      setState(() {
        _resultado = 'Por favor, ingrese valores válidos.';
      });
      return;
    }

    List<String> diasSemana = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo'];
    List<String> meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];

    String fechaEnPalabras = '${diasSemana[diaSemana - 1]}, $diaMes de ${meses[mes - 1]}';

    setState(() {
      _resultado = fechaEnPalabras;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio01: Fecha en palabras'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _diaSemanaController,
              decoration: InputDecoration(labelText: 'Día de la semana (1-7)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _diaMesController,
              decoration: InputDecoration(labelText: 'Día del mes (1-31)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _mesController,
              decoration: InputDecoration(labelText: 'Mes (1-12)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularFechaEnPalabras,
              child: Text('Calcular Fecha en Palabras'),
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
