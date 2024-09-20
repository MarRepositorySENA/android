import 'package:flutter/material.dart';

class Ejercicio18 extends StatefulWidget {
  @override
  _Ejercicio18State createState() => _Ejercicio18State();
}

class _Ejercicio18State extends State<Ejercicio18> {
  Map<String, int> _niveles = {
    'Primaria': 0,
    'Secundaria': 0,
    'Carrera Técnica': 0,
    'Profesional': 0,
    'Posgrado': 0,
  };
  int _totalPersonas = 0;

  void _agregarNivel(String nivel) {
    setState(() {
      _niveles[nivel] = _niveles[nivel]! + 1;
      _totalPersonas++;
    });
  }

  void _mostrarPorcentajes() {
    String resultados = _niveles.entries.map((entry) {
      double porcentaje = (_totalPersonas > 0)
          ? (entry.value / _totalPersonas) * 100
          : 0;
      return '${entry.key}: ${porcentaje.toStringAsFixed(2)}%';
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
      _niveles.updateAll((key, value) => 0);
      _totalPersonas = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ejercicio18: Porcentaje de estudios'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('Personas encuestadas: $_totalPersonas'),
              SizedBox(height: 10),
              ..._niveles.keys.map((nivel) {
                return ElevatedButton(
                  onPressed: () => _agregarNivel(nivel),
                  child: Text(nivel),
                );
              }).toList(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _mostrarPorcentajes,
                child: Text('Mostrar porcentajes'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _reiniciar,
                child: Text('Reiniciar'),
              ),
            ],
          ),
        ));
  }
}
