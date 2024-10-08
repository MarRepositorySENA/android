import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/Seguridad/persona_screen.dart';
import 'screens/role_screen.dart';
import 'screens/Seguridad/modulo_screen.dart';
import 'screens/vistas_roles_screen.dart';
import 'screens/Parametrizacion/pais_screen.dart';
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
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => LoginScreen());
          case '/home':
            final List<dynamic> permissions = settings.arguments as List<dynamic>;
            return MaterialPageRoute(builder: (context) => HomeScreen(permissions: permissions));
          case '/menu':
            final List<dynamic> permissions = settings.arguments as List<dynamic>;
            return MaterialPageRoute(builder: (context) => MenuScreen(permissions: permissions));
          case '/registro_persona':
            return MaterialPageRoute(builder: (context) => PersonaScreen());
          case '/registro_role':
            return MaterialPageRoute(builder: (context) => RoleScreen());
          case '/registro_modulo':
            return MaterialPageRoute(builder: (context) => ModuloScreen());
          case '/registro_vistas_roles':
            return MaterialPageRoute(builder: (context) => VistasRolesScreen());
          case '/registro_pais':
            return MaterialPageRoute(builder: (context) => PaisScreen());
          default:
            return null;
        }
      },
    );
  }
}
