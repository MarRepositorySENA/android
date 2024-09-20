import 'package:flutter/material.dart';

class Ejercicio13 extends StatelessWidget {
  final TextEditingController hombresController = TextEditingController();
  final TextEditingController mujeresController = TextEditingController();
  final TextEditingController grupoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 13: Promedio de Edades'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: hombresController,
              decoration: InputDecoration(labelText: 'Ingresa edades de hombres separadas por coma'),
            ),
            TextField(
              controller: mujeresController,
              decoration: InputDecoration(labelText: 'Ingresa edades de mujeres separadas por coma'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                List<int> hombres = _parseEdades(hombresController.text);
                List<int> mujeres = _parseEdades(mujeresController.text);
                double promedioHombres = _calcularPromedio(hombres);
                double promedioMujeres = _calcularPromedio(mujeres);
                double promedioTotal = _calcularPromedio([...hombres, ...mujeres]);

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text(
                        'Promedio Hombres: $promedioHombres\nPromedio Mujeres: $promedioMujeres\nPromedio Total: $promedioTotal'),
                  ),
                );
              },
              child: Text('Calcular Promedio'),
            ),
          ],
        ),
      ),
    );
  }

  List<int> _parseEdades(String edades) {
    return edades.split(',').map((e) => int.parse(e.trim())).toList();
  }

  double _calcularPromedio(List<int> edades) {
    if (edades.isEmpty) return 0;
    return edades.reduce((a, b) => a + b) / edades.length;
  }
}
