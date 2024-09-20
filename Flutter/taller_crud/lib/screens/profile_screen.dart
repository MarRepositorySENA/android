import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';  // Para abrir el enlace de LinkedIn
import 'package:font_awesome_flutter/font_awesome_flutter.dart';  // Para los íconos

class ProfileScreen extends StatelessWidget {
  // Función para abrir el enlace de LinkedIn
  void _launchLinkedIn() async {
    const url = 'https://www.linkedin.com/in/maryury-gonzalez-bonilla-876043268';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir el enlace $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: Colors.blue[900],
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Acción de editar perfil
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  'https://i.pinimg.com/originals/3d/b2/13/3db21382ccdb5e4b1e9b05cbcf17df9a.jpg',  // Imagen de Inuyasha
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Maryury Gonzalez Bonilla',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Desarrolladora Junior Full-Stack',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[700],
                ),
              ),
              Divider(
                height: 40,
                thickness: 2,
                color: Colors.grey[300],
                indent: 50,
                endIndent: 50,
              ),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.email, color: Colors.blue[900]),
                        title: Text('maryury@example.com'),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone, color: Colors.blue[900]),
                        title: Text('+57 300 123 4567'),
                      ),
                      ListTile(
                        leading: Icon(Icons.location_on, color: Colors.blue[900]),
                        title: Text('Colombia'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _launchLinkedIn,  // Enlace a LinkedIn
                icon: Icon(Icons.link),
                label: Text('Visitar LinkedIn'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.blue[700], size: 30),
                    onPressed: () {
                      // Abre Facebook
                    },
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.twitter, color: Colors.blue, size: 30),
                    onPressed: () {
                      // Abre Twitter
                    },
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.instagram, color: Colors.pink, size: 30),
                    onPressed: () {
                      // Abre Instagram
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
