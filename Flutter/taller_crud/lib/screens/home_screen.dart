import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenido a la Librería 2694679',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
            SizedBox(height: 20),
            Icon(Icons.library_books, size: 100, color: Colors.blue[800]),
            SizedBox(height: 20),
            Text(
              'Explora nuestra colección de libros y más',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue[600],
              ),
            ),
            // SizedBox(height: 40),
            // ElevatedButton(
            //   onPressed: () {
            //     // Aquí podrías enlazar con otra pantalla si es necesario
            //   },
            //   child: Text('Ver Catálogo'),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.blue[700], // Corregido
            //     foregroundColor: Colors.white,     // Corregido
            //     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
