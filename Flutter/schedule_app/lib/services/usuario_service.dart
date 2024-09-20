import 'package:http/http.dart' as http;
import 'dart:convert';

class UsuarioService {
  final String usuarioEndpoint = 'http://localhost:9000/base/api/v1/base/security/usuario';

  Future<Map<String, dynamic>> getUsuario(int id) async {
    final url = Uri.parse('$usuarioEndpoint/$id');
    
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al obtener los datos del usuario');
    }
  }
}
