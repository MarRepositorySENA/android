import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class PersonaScreen extends StatefulWidget {
  @override
  _PersonaScreenState createState() => _PersonaScreenState();
}

class _PersonaScreenState extends State<PersonaScreen> {
  List<dynamic> _personas = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPersonas();
  }

  Future<void> _fetchPersonas() async {
    final url = Uri.parse('http://localhost:9000/base/api/v1/base/security/persona');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          // Decodificar en UTF-8
          _personas = json.decode(utf8.decode(response.bodyBytes));
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
        title: Text('Registro de Personas'),
      ),
      body: Container(
        color: Color(0xFFFFFFFF), // Fondo blanco
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _personas.length,
                itemBuilder: (context, index) {
                  final persona = _personas[index];
                  return Card(
                    color: Color(0xFF004455), // Color de la tarjeta
                    margin: EdgeInsets.all(8),
                    child: ExpansionTile(
                      backgroundColor: Color(0xFF39A900), // Color al expandir
                      title: Text(
                        '${persona['primerNombre']} ${persona['primerApellido']}',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        'Email: ${persona['email']}',
                        style: TextStyle(color: Colors.white),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Tipo Documento: ${persona['tipoDocumento']}', style: TextStyle(color: Colors.white)),
                              Text('Número Documento: ${persona['numeroDocumento']}', style: TextStyle(color: Colors.white)),
                              Text('Teléfono: ${persona['telefono']}', style: TextStyle(color: Colors.white)),
                              Text('Dirección: ${persona['direccion']}', style: TextStyle(color: Colors.white)),
                              Text('Fecha de Nacimiento: ${persona['fechaNacimiento']}', style: TextStyle(color: Colors.white)),
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
