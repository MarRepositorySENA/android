import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  final List<dynamic> permissions;

  MenuScreen({required this.permissions});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  Map<String, List<dynamic>> moduleViews = {}; // Módulos y sus vistas asociadas
  String? selectedModule; // Módulo seleccionado actualmente

  @override
  void initState() {
    super.initState();
    _organizePermissions(); // Organiza los permisos en módulos y vistas
  }

  void _organizePermissions() {
    for (var permission in widget.permissions) {
      String moduleName = permission['moduloNombre'];
      if (!moduleViews.containsKey(moduleName)) {
        moduleViews[moduleName] = [];
      }
      moduleViews[moduleName]?.add(permission);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú de Navegación'),
      ),
      body: Column(
        children: [
          // Lista de módulos
          Expanded(
            child: ListView(
              children: moduleViews.keys.map((moduleName) {
                return ListTile(
                  leading: Icon(Icons.folder_open),
                  title: Text(moduleName),
                  trailing: selectedModule == moduleName
                      ? Icon(Icons.keyboard_arrow_up)
                      : Icon(Icons.keyboard_arrow_down),
                  onTap: () {
                    setState(() {
                      selectedModule = selectedModule == moduleName ? null : moduleName;
                    });
                  },
                );
              }).toList(),
            ),
          ),
          // Si hay un módulo seleccionado, muestra sus vistas
          if (selectedModule != null)
            Expanded(
              child: ListView.builder(
                itemCount: moduleViews[selectedModule]!.length,
                itemBuilder: (context, index) {
                  final view = moduleViews[selectedModule]![index];
                  return ListTile(
                    leading: Icon(Icons.view_module),
                    title: Text(view['vistaNombre']),
                    onTap: () {
                      // Navega a la vista correspondiente
                      if (view['vistaNombre'] == 'Persona') {
                        Navigator.pushNamed(context, '/registro_persona');
                      } else {
                        Navigator.pushNamed(context, view['vistaRuta']);
                      }
                    },
                  );
                },
              ),
            ),
        ],
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
        currentIndex: 1, // Estás en la pantalla del menú
        onTap: (int index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home'); // Redirige a Home
          }
          // Puedes agregar acciones adicionales para otros ítems del menú
        },
      ),
    );
  }
}
