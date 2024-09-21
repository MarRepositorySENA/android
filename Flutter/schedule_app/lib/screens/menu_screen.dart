import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  final List<dynamic>? permissions; // Permitir que sea null

  MenuScreen({required this.permissions});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  Map<String, List<dynamic>> moduleViews = {};

  @override
  void initState() {
    super.initState();
    _organizePermissions();
  }

  void _organizePermissions() {
    if (widget.permissions != null) {
      for (var permission in widget.permissions!) {
        String moduleName = permission['moduloNombre'];
        if (!moduleViews.containsKey(moduleName)) {
          moduleViews[moduleName] = [];
        }
        moduleViews[moduleName]?.add(permission);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú de Navegación'),
      ),
      body: ListView(
        children: moduleViews.keys.map((moduleName) {
          return Card(
            color: Color(0xFF004455),
            margin: EdgeInsets.all(8),
            child: ExpansionTile(
              title: Text(moduleName, style: TextStyle(color: Colors.white)),
              children: moduleViews[moduleName]!.map<Widget>((view) {
                return Container(
                  margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF39A900),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    title: Text(view['vistaNombre'], style: TextStyle(color: Colors.black)),
                    onTap: () {
                      Navigator.pushNamed(context, view['vistaRuta']);
                    },
                  ),
                );
              }).toList(),
            ),
          );
        }).toList(),
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
        currentIndex: 1,
        onTap: (int index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home', arguments: widget.permissions);
          } else if (index == 2) {
            Navigator.pushNamed(context, '/ajustes'); // Asegúrate de tener la ruta correspondiente
          }
        },
      ),
    );
  }
}
