import 'package:flutter/material.dart';
import 'screens/book_list_screen.dart'; // Pantalla de listado de libros
import 'screens/profile_screen.dart';  // Pantalla de perfil
import 'screens/home_screen.dart';     // Pantalla de inicio

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taller CRUD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,  // Elimina el banner de "Debug"
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // Opciones de las pantallas que se mostrarán según el índice seleccionado
  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),      // Pantalla de inicio
    BookListScreen(),  // Pantalla de listado de libros
    ProfileScreen(),   // Pantalla de perfil
  ];

  // Actualiza el índice seleccionado cuando el usuario toque un icono en la barra de navegación
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Taller CRUD'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Listado',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,        // Muestra el icono seleccionado
        selectedItemColor: Colors.blue,      // Color del icono seleccionado
        onTap: _onItemTapped,                // Cambia la pantalla según el icono seleccionado
      ),
    );
  }
}
