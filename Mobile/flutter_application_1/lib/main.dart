import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/user_registration.dart';
import 'package:flutter_application_1/screens/user_registry.dart';
import 'package:flutter_application_1/screens/person_registration_screen.dart';
import 'package:flutter_application_1/screens/person_regystry.dart'; // Ruta correcta

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // Método para navegar a la pantalla de registro de personas
  void _navigateToPersonRegistrationScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PersonRegistrationScreen()),
    );
  }

  // Método para navegar a la pantalla de personas registradas
  void _navigateToPersonRegistry() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PersonRegistrationScreen()),
    );
  }
void _navigateToUserRegistration() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UsuariosRegistrados)),
    );
  // Método para navegar a la pantalla de usuarios registrados
  void _navigateToUserRegistry() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UsuariosRegistrados()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shedule Sena'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _navigateToUserRegistry,
              child: const Text('Ir a Registro de Usuarios'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _navigateToPersonRegistrationScreen,
              child: const Text('Ir a Registro de Personas'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _navi,
              child: const Text('Ir a Personas Registradas'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _navigateToPersonRegistry,
              child: const Text('Ir a Personas Registradas'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    
    );
  }
}

// Clase para Usuarios Registrados
class UsuariosRegistrados extends StatelessWidget {
  final List<Usuario> usuarios = [
    Usuario(
      username: 'user1',
      contrasenia: 'password1',
      personId: '123456',
    ),
    // Agrega más usuarios a la lista
  ];

  UsuariosRegistrados({Key? key}) : super(key: key); // Se elimina "const"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuarios Registrados'),
        backgroundColor: Color(0xFF004455), // Color personalizado
      ),
      body: ListView.builder(
        itemCount: usuarios.length,
        itemBuilder: (context, index) {
          final usuario = usuarios[index];
          return Card(
            child: ListTile(
              title: Text('Usuario: ${usuario.username}'),
              subtitle: Text('ID de Persona: ${usuario.personId}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      // Lógica para modificar el registro
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
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
          // Lógica para agregar un nuevo registro de usuario
        },
        child: const Icon(Icons.add),
        backgroundColor: Color(0xFF004455), // Color personalizado
      ),
    );
  }
}

class Usuario {
  final String username;
  final String contrasenia;
  final String personId;

  Usuario({
    required this.username,
    required this.contrasenia,
    required this.personId,
  });
}
