import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VistasRolesScreen extends StatefulWidget {
  @override
  _VistasRolesScreenState createState() => _VistasRolesScreenState();
}

class _VistasRolesScreenState extends State<VistasRolesScreen> {
  List<dynamic> _vistasRoles = [];
  bool _isLoading = true;
  Map<int, List<dynamic>> roleModules = {};

  @override
  void initState() {
    super.initState();
    _fetchVistasRoles();
  }

  Future<void> _fetchVistasRoles() async {
    final url = Uri.parse('http://localhost:9000/base/api/v1/base/security/vistas_roles');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> vistasRolesData = json.decode(utf8.decode(response.bodyBytes));
        _organizeData(vistasRolesData);
        setState(() {
          _vistasRoles = vistasRolesData;
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

  // Organizar la data por roles y módulos
  void _organizeData(List<dynamic> data) {
    for (var item in data) {
      final roleId = item['roleId']['id'];
      final moduloId = item['vistaId']['moduloId']['id'];

      // Verificar si el Role ya está en el mapa, si no, inicializarlo
      if (roleModules[roleId] == null) {
        roleModules[roleId] = [];
      }

      // Verificar si ya se agregó el módulo al role
      bool moduloExists = roleModules[roleId]!.any((modulo) => modulo['moduloId']['id'] == moduloId);
      if (!moduloExists) {
        roleModules[roleId]!.add({
          'moduloId': item['vistaId']['moduloId'],
          'vistas': []
        });
      }

      // Añadir la vista al módulo correspondiente
      roleModules[roleId]!
          .firstWhere((modulo) => modulo['moduloId']['id'] == moduloId)['vistas']
          .add(item['vistaId']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vistas por Roles'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: roleModules.entries.map((entry) {
                final role = _vistasRoles.firstWhere((item) => item['roleId']['id'] == entry.key)['roleId'];

                return Card(
                  color: Color(0xFF004455), // Color para el Role
                  margin: EdgeInsets.all(8),
                  child: ExpansionTile(
                    title: Text(
                      role['nombre'], // Nombre del Role
                      style: TextStyle(color: Colors.white),
                    ),
                    children: entry.value.map<Widget>((modulo) {
                      final moduloData = modulo['moduloId'];
                      return ListTile(
                        title: ExpansionTile(
                          title: Text(
                            moduloData['nombre'], // Nombre del Módulo
                            style: TextStyle(color: Colors.white),
                          ),
                          tilePadding: EdgeInsets.only(left: 20),
                          backgroundColor: Color(0xFF006666), // Color para el Módulo
                          children: modulo['vistas'].map<Widget>((vista) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 40, right: 10, top: 5, bottom: 5),
                              child: Card(
                                color: Color(0xFF39A900), // Color al expandir la Vista
                                child: ListTile(
                                  title: Text(
                                    vista['nombre'], // Nombre de la Vista
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(
                                    'Ruta: ${vista['ruta']}', // Ruta de la Vista
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    }).toList(),
                  ),
                );
              }).toList(),
            ),
    );
  }
}
