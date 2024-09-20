import 'package:flutter/material.dart';
import 'package:schedule_app/services/usuario_service.dart';

class UsuarioPersonaScreen extends StatefulWidget {
  final int usuarioId; // El ID del usuario que se va a consultar

  UsuarioPersonaScreen({required this.usuarioId});

  @override
  _UsuarioPersonaScreenState createState() => _UsuarioPersonaScreenState();
}

class _UsuarioPersonaScreenState extends State<UsuarioPersonaScreen> {
  final UsuarioService _usuarioService = UsuarioService();
  Map<String, dynamic>? _usuarioData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUsuarioData();
  }

  Future<void> _fetchUsuarioData() async {
    try {
      final data = await _usuarioService.getUsuario(widget.usuarioId);
      setState(() {
        _usuarioData = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al cargar los datos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de Usuario y Persona'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _usuarioData != null
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Usuario: ${_usuarioData!['usuarioName']}',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Contraseña: ${_usuarioData!['contrasenia']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Divider(),
                      Text(
                        'Datos de la Persona:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Nombre: ${_usuarioData!['personaId']['primerNombre']} ${_usuarioData!['personaId']['segundoNombre']} ${_usuarioData!['personaId']['primerApellido']} ${_usuarioData!['personaId']['segundoApellido']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Documento: ${_usuarioData!['personaId']['tipoDocumento']} ${_usuarioData!['personaId']['numeroDocumento']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Email: ${_usuarioData!['personaId']['email']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Teléfono: ${_usuarioData!['personaId']['telefono']}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                )
              : Center(child: Text('No se encontraron datos')),
    );
  }
}
