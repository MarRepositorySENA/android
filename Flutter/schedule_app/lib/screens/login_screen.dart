import 'package:flutter/material.dart';
import 'package:schedule_app/services/auth_service.dart'; // Asegúrate de usar la ruta correcta

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    bool isLoggedIn = await _authService.login(
      _usernameController.text,
      _passwordController.text,
    );

    if (isLoggedIn) {
      // Obtener permisos del usuario
      List<dynamic> permissions = await _authService.fetchPermissions(_usernameController.text);
      
      // Navegar a la pantalla de inicio con los permisos
      Navigator.pushReplacementNamed(context, '/home', arguments: permissions);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Credenciales incorrectas')),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png', height: 100),
              SizedBox(height: 20),
              Text(
                'Login',
                style: TextStyle(fontSize: 20, color: Colors.teal),
              ),
              SizedBox(height: 30),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Usuario',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  // Acción de recuperar contraseña
                },
                child: Text('Recuperar contraseña'),
              ),
              SizedBox(height: 20),
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0xFF004455)), // Color principal
                        foregroundColor: MaterialStateProperty.all(Colors.white), // Color del texto
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered)) {
                              return Color(0xFF39A900); // Color hover
                            }
                            return null; // Dejar el color por defecto
                          },
                        ),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      onPressed: _login,
                      child: Text(
                        'ACCEDER',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
