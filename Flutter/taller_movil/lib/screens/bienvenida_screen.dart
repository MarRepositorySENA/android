import 'package:flutter/material.dart';

class BienvenidaScreen extends StatelessWidget {
  const BienvenidaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Icono grande o logo
              Icon(
                Icons.school_outlined,
                size: 100,
                color: Colors.deepPurple,
              ),
              SizedBox(height: 20),
              // Título o nombre de la app
              Text(
                'Bienvenido al Taller Móvil Básico',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              // Descripción breve de la app
              Text(
                'Esta aplicación contiene múltiples ejercicios prácticos para ayudarte a desarrollar habilidades en Flutter.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              // Botón para abrir el menú
              ElevatedButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Abre el Drawer (menú)
                },
                child: Text('Explorar Ejercicios'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
