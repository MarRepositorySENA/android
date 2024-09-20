import 'dart:convert';
import 'package:http/http.dart' as http;

class BookService {
  final String baseUrl = 'https://openlibrary.org';

  Future<List> getBooks() async {
    final response = await http.get(Uri.parse('$baseUrl/subjects/love.json?limit=10'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data['works'];
    } else {
      throw Exception('Error al obtener los libros');
    }
  }

  // Otros métodos para crear, actualizar y eliminar irán aquí.
}
