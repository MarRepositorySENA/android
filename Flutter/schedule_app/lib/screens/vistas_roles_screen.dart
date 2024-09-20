import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VistasRolesScreen extends StatefulWidget {
  @override
  _VistasRolesScreenState createState() => _VistasRolesScreenState();
}

class _VistasRolesScreenState extends State<VistasRolesScreen> {
  List<dynamic> _vistasRoles = [];
  List<dynamic> _vistas = [];
  List<dynamic> _roles = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchVistasRoles();
    _fetchVistas();
    _fetchRoles();
  }

  Future<void> _fetchVistasRoles() async {
    final url = Uri.parse('http://localhost:9000/base/api/v1/base/security/vistas_roles');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          _vistasRoles = json.decode(utf8.decode(response.bodyBytes));
        });
      } else {
        throw Exception('Error al cargar datos de vistas-roles');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> _fetchVistas() async {
    final url = Uri.parse('http://localhost:9000/base/api/v1/base/security/vista');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          _vistas = json.decode(utf8.decode(response.bodyBytes));
        });
      } else {
        throw Exception('Error al cargar datos de vistas');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> _fetchRoles() async {
    final url = Uri.parse('http://localhost:9000/base/api/v1/base/security/role');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          _roles = json.decode(utf8.decode(response.bodyBytes));
          _isLoading = false; // Marcamos como no cargando aquí
        });
      } else {
        throw Exception('Error al cargar datos de roles');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  List<dynamic> _getVistasForRole(int roleId) {
    // Obtener las vistas que pertenecen al rol específico
    return _vistasRoles
        .where((vr) => vr['roleId']['id'] == roleId)
        .map((vr) => vr['vistaId'])
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Roles y sus Vistas'),
      ),
      body: Container(
        color: Color(0xFFFFFFFF), // Fondo blanco
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _roles.length,
                itemBuilder: (context, index) {
                  final role = _roles[index];
                  final vistasForRole = _getVistasForRole(role['id']); // Obtener las vistas del rol actual

                  return Card(
                    margin: EdgeInsets.all(8),
                    color: Color(0xFF004455), // Color del role (sin cambiar)
                    child: ExpansionTile(
                      title: Text(
                        '${role['nombre']}',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        '${role['descripcion']}',
                        style: TextStyle(color: Colors.white),
                      ),
                      // Cuando se expande el tile, solo las vistas se mostrarán con color verde
                      children: vistasForRole.isNotEmpty
                          ? vistasForRole.map<Widget>((vista) {
                              return Container(
                                color: Color(0xFF39A900), // Color de las vistas al expandirse
                                child: ListTile(
                                  title: Text(
                                    vista['nombre'],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(
                                    'Ruta: ${vista['ruta']}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              );
                            }).toList()
                          : [
                              ListTile(
                                title: Text(
                                  'No hay vistas asignadas',
                                  style: TextStyle(color: Colors.white),
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
