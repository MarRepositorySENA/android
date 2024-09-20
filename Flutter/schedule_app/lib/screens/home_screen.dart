import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<dynamic> permissions;

  HomeScreen({required this.permissions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', height: 30), // Asegúrate de tener un logo
            SizedBox(width: 10),
            Text(
              'Gestión de Horarios - CIES',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xFF004455), // Color personalizado
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'Bienvenido al Sistema de Gestión de Horarios',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF004455),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Facilitamos la planificación y administración de horarios.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 30),
              // Section with Cards
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  _buildCard(
                    icon: Icons.schedule,
                    title: 'Ver Horarios',
                    description: 'Consulta y gestiona horarios fácilmente.',
                    onTap: () {
                      // Navega a otra pantalla
                    },
                  ),
                  _buildCard(
                    icon: Icons.person,
                    title: 'Mi Perfil',
                    description: 'Actualiza tu información personal.',
                    onTap: () {
                      // Navega a otra pantalla
                    },
                  ),
                  _buildCard(
                    icon: Icons.analytics,
                    title: 'Reportes',
                    description: 'Genera y revisa reportes de asistencia.',
                    onTap: () {
                      // Navega a otra pantalla
                    },
                  ),
                ],
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
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
        currentIndex: 0,
        selectedItemColor: Color(0xFF004455),
        onTap: (int index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/menu', arguments: permissions);
          }
          // Agrega navegación para otras secciones si es necesario
        },
      ),
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          width: 160,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Color(0xFF004455)),
              SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
