import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<dynamic> permissions;

  HomeScreen({required this.permissions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sistema de Gestión de Horarios - CIES'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Bienvenido al Sistema de Gestión de Horarios del CIES - SENA',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Facilitamos la planificación y administración de horarios, '
              'automatizando tareas repetitivas para mejorar la eficiencia.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Navegar al menú dinámico con los permisos del usuario
                Navigator.pushNamed(context, '/menu', arguments: permissions);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.teal),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: Text(
                'Ir al Menú de Navegación',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menú',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ajustes',
          ),
        ],
        currentIndex: 0, // Estás en la pantalla de Home
        onTap: (int index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/menu', arguments: permissions); // Redirige al menú
          }
          // Puedes agregar acciones adicionales para otros ítems del menú
        },
      ),
    );
  }
}
