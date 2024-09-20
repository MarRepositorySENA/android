import 'package:flutter/material.dart';
// Solo importamos la pantalla de bienvenida desde la carpeta screens
import 'screens/bienvenida_screen.dart';
// Los ejercicios se mantienen fuera de la carpeta screens
import 'ejercicio01.dart';
import 'ejercicio02.dart';
import 'ejercicio03.dart';
import 'ejercicio04.dart';
import 'ejercicio05.dart';
import 'ejercicio06.dart';
import 'ejercicio07.dart';
import 'ejercicio08.dart';
import 'ejercicio09.dart';
import 'ejercicio10.dart';
import 'ejercicio11.dart';
import 'ejercicio12.dart';
import 'ejercicio13.dart';
import 'ejercicio14.dart';
import 'ejercicio15.dart';
import 'ejercicio16.dart';
import 'ejercicio17.dart';
import 'ejercicio18.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taller Móvil Básico',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Mapa que asocia cada ejercicio con su nombre
  final Map<String, Widget> _ejercicios = {
    'Ejercicio01: Fecha en palabras': Ejercicio01(),
    'Ejercicio02: Valor absoluto': Ejercicio02(),
    'Ejercicio03: Pago de trabajadores': Ejercicio03(),
    'Ejercicio04: Descuento por compra de computadoras': Ejercicio04(),
    'Ejercicio05: Precio de llantas': Ejercicio05(),
    'Ejercicio06: Celsius a Kelvin o Fahrenheit': Ejercicio06(),
    'Ejercicio07: Kelvin a Celsius o Fahrenheit': Ejercicio07(),
    'Ejercicio08: Fahrenheit a Celsius o Kelvin': Ejercicio08(),
    'Ejercicio09: Número a letras': Ejercicio09(),
    'Ejercicio10: Dígito o no dígito': Ejercicio10(),
    'Ejercicio11: Vocal o no vocal': Ejercicio11(),
    'Ejercicio12: Romano a decimal': Ejercicio12(),
    'Ejercicio13: Promedio de edades': Ejercicio13(),
    'Ejercicio14: Menor de n números': Ejercicio14(),
    'Ejercicio15: Mayor de n números': Ejercicio15(),
    'Ejercicio16: Total cobrado en un día': Ejercicio16(),
    'Ejercicio17: Club contra la obesidad': Ejercicio17(),
    'Ejercicio18: Porcentaje de estudios': Ejercicio18(),
  };

  // Variable para manejar el ejercicio seleccionado
  String _ejercicioSeleccionado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Taller Móvil Básico'),
      ),
      // Si no hay un ejercicio seleccionado, muestra la pantalla de bienvenida
      body: _ejercicioSeleccionado.isEmpty
          ? BienvenidaScreen()  // Pantalla de bienvenida
          : _ejercicios[_ejercicioSeleccionado]!, // Muestra el ejercicio seleccionado
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Selecciona un Ejercicio',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            // Genera dinámicamente las opciones del menú para cada ejercicio
            ..._ejercicios.keys.map((String ejercicio) {
              return ListTile(
                title: Text(ejercicio),
                onTap: () {
                  setState(() {
                    _ejercicioSeleccionado = ejercicio;  // Actualiza el ejercicio seleccionado
                  });
                  Navigator.pop(context); // Cierra el Drawer
                },
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
