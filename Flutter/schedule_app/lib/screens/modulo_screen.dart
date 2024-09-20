import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ModuloScreen extends StatefulWidget {
  @override
  _ModuloScreenState createState() => _ModuloScreenState();
}

class _ModuloScreenState extends State<ModuloScreen> {
  List<dynamic> _modulos = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchModulos();
  }

  Future<void> _fetchModulos() async {
    final url = Uri.parse('http://localhost:9000/base/api/v1/base/security/modulo');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          // Decodificar en UTF-8
          _modulos = json.decode(utf8.decode(response.bodyBytes));
          _isLoading = false;
        });
      } else {
        throw Exception('Error al cargar datos');
      }
    } catch (error) {
      print('Error: $error');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Módulos'),
      ),
      body: Container(
        color: Color(0xFFFFFFFF), // Fondo blanco
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _modulos.length,
                itemBuilder: (context, index) {
                  final modulo = _modulos[index];
                  return Card(
                    color: Color(0xFF004455), // Color de la tarjeta
                    margin: EdgeInsets.all(8),
                    child: ExpansionTile(
                      backgroundColor: Color(0xFF39A900), // Color al expandir
                      title: Text(
                        '${modulo['nombre']}', // Cambia esto según tu estructura de datos
                        style: TextStyle(color: Colors.white),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Descripción: ${modulo['descripcion']}', style: TextStyle(color: Colors.white)), // Cambia esto según tu estructura de datos
                              // Agrega más campos según sea necesario
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xFF004455)),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          onPressed: () {
            Navigator.pop(context); // Regresa a la pantalla anterior
          },
          child: Text('Volver'),
        ),
      ),
    );
  }
}
