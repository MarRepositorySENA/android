import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaisScreen extends StatefulWidget {
  @override
  _PaisScreenState createState() => _PaisScreenState();
}

class _PaisScreenState extends State<PaisScreen> {
  List<dynamic> _paises = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPaises();
  }

  Future<void> _fetchPaises() async {
    final url = Uri.parse('http://localhost:9000/base/api/v1/base/parameter/infraestructura/pais');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          // Decodificar en UTF-8
          _paises = json.decode(utf8.decode(response.bodyBytes));
          _isLoading = false;
        });
      } else {
        throw Exception('Error al cargar los datos');
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
        title: Text('Registro de Paises'),
      ),
      body: Container(
        color: Color(0xFFFFFFFF), // Fondo
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _paises.length,
                itemBuilder: (context, index) {
                  final pais = _paises[index];
                  return Card(
                    color: Color(0xFF004455), // Color de la tarjeta
                    margin: EdgeInsets.all(8),
                    child: ExpansionTile(
                      backgroundColor: Color(0xFF39A900), // Color al expandir
                      title: Text(
                        '${pais['nombre']}',
                        style: TextStyle(color: Colors.white), // Letra
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Código: ${pais['codigo']}', style: TextStyle(color: Colors.white)),
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
            Navigator.pop(context);
          },
          child: Text('Volver'),
        ),
      ),
    );
  }
}
