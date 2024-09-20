import 'package:flutter/material.dart';

class Ejercicio17 extends StatefulWidget {
  @override
  _Ejercicio17State createState() => _Ejercicio17State();
}

class _Ejercicio17State extends State<Ejercicio17> {
  final List<Map<String, dynamic>> _personas = [];
  final TextEditingController _pesoAnteriorController = TextEditingController();
  final TextEditingController _pesosController = TextEditingController();
  int _indicePersona = 1;

  void _calcularDiferencia() {
    double pesoAnterior = double.parse(_pesoAnteriorController.text);
    List<double> pesos = _pesosController.text
        .split(',')
        .map((e) => double.parse(e.trim()))
        .toList();

    double promedioPeso = pesos.reduce((a, b) => a + b) / pesos.length;
    double diferencia = promedioPeso - pesoAnterior;
    String estado = diferencia > 0 ? 'SUBIÓ' : 'BAJÓ';

    setState(() {
      _personas.add({
        'persona': _indicePersona,
        'diferencia': diferencia.abs(),
        'estado': estado,
      });
      _indicePersona++;
      _pesoAnteriorController.clear();
      _pesosController.clear();
    });
  }

  void _mostrarResultados() {
    String resultados = _personas.map((p) {
      return 'Persona ${p['persona']}: ${p['estado']} ${p['diferencia'].toStringAsFixed(2)} kg';
    }).join('\n');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(resultados),
      ),
    );
  }

  void _reiniciar() {
    setState(() {
      _personas.clear();
      _indicePersona = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ejercicio17: Club contra la obesidad'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _pesoAnteriorController,
                  decoration: InputDecoration(labelText: 'Peso anterior'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _pesosController,
                  decoration: InputDecoration(
                      labelText: 'Pesos actuales (10), separados por coma'),
                ),
                ElevatedButton(
                  onPressed: _calcularDiferencia,
                  child: Text('Calcular diferencia'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _mostrarResultados,
                  child: Text('Mostrar resultados'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _reiniciar,
                  child: Text('Reiniciar'),
                ),
              ],
            ),
          ),
        ));
  }
}
