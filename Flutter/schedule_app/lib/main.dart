import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart'; // Importa otras pantallas como Home si ya las tienes
import 'screens/menu_screen.dart';
import 'screens/registro_persona_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      onGenerateRoute: (settings) {
        if (settings.name == '/home') {
          final List<dynamic> permissions = settings.arguments as List<dynamic>;
          return MaterialPageRoute(
            builder: (context) {
              return HomeScreen(permissions: permissions);
            },
          );
        } else if (settings.name == '/menu') {
          final List<dynamic> permissions = settings.arguments as List<dynamic>;
          return MaterialPageRoute(
            builder: (context) {
              return MenuScreen(permissions: permissions);
            },
          );
           } else if (settings.name == '/registro_persona') {
            final int usuarioId = settings.arguments as int;
          return MaterialPageRoute(
            builder: (context) {
              return UsuarioPersonaScreen(usuarioId: usuarioId);
            },
          );
        }
        switch (settings.name) {
          case '/login':
            return MaterialPageRoute(builder: (context) => LoginScreen());
          default:
            return null;
        }
      },
    );
  }
}
