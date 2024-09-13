import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class UsersRegistered extends StatelessWidget {
  final List<User> users = [
    User(
      username: 'johndoe',
      email: 'john.doe@example.com',
      phone: '123456789',
      document: '987654321',
    ),
    // Agrega más usuarios a la lista
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuarios Registrados'),
        backgroundColor: Color(0xFF004455), // Color personalizado.
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Card(
            child: ListTile(
              title: Text(user.username),
              subtitle: Text('Correo: ${user.email}\nTeléfono: ${user.phone}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      // Lógica para modificar el registro
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // Lógica para eliminar el registro
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Lógica para agregar un nuevo registro
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF004455), // Color personalizado.
      ),
    );
  }
}

class User {
  final String username;
  final String email;
  final String phone;
  final String document;

  User({
    required this.username,
    required this.email,
    required this.phone,
    required this.document,
  });
}
