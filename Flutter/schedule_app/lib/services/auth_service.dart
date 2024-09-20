import 'dart:convert'; // Necesario para jsonDecode
import 'package:http/http.dart' as http;

class AuthService {
  final String _baseUrl = 'http://192.168.1.59:9000/base/api/v1/base/security/usuario/validar/datos';
  final String _permissionsUrl = 'http://192.168.1.59:9000/base/api/v1/base/security/usuario/validar/permisos';

  Future<bool> login(String username, String password) async {
    final url = Uri.parse('$_baseUrl?user=$username&password=$password');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return response.body == 'true';
    } else {
      throw Exception('Error al conectar con el servidor');
    }
  }

  Future<List<dynamic>> fetchPermissions(String username) async {
    final url = Uri.parse('$_permissionsUrl?User=$username');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes)); // Decodifica el JSON con UTF-8
    } else {
      throw Exception('Error al conectar con el servidor');
    }
  }
}
