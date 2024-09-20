import 'package:http/http.dart' as http;

class AuthService {
  final String _baseUrl = 'http://192.168.1.59:9000/base/api/v1/base/security/usuario/validar/datos';

  Future<bool> login(String username, String password) async {
    final url = Uri.parse('$_baseUrl?user=$username&password=$password');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Interpreta la respuesta true o false
      return response.body == 'true';
    } else {
      throw Exception('Error al conectar con el servidor');
    }
  }
}
