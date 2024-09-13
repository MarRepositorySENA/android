import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class PersonRegistrationScreen extends StatefulWidget {
  @override
  _PersonRegistrationScreenState createState() => _PersonRegistrationScreenState();
}

class _PersonRegistrationScreenState extends State<PersonRegistrationScreen> {
  // Controladores para los campos de texto
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController documentController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // Lista de opciones para tipo de documento
  final List<String> documentTypes = ['Cédula', 'Pasaporte', 'Licencia'];
  String? selectedDocumentType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Usuario'),
        backgroundColor: Color(0xFF004455), // Color personalizado.
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField(nameController, 'Nombres'),
            SizedBox(height: 10),
            _buildTextField(lastNameController, 'Apellidos'),
            SizedBox(height: 10),
            _buildDropdownField(),
            SizedBox(height: 10),
            _buildTextField(documentController, 'Documento'),
            SizedBox(height: 10),
            _buildTextField(emailController, 'Correo', keyboardType: TextInputType.emailAddress),
            SizedBox(height: 10),
            _buildTextField(phoneController, 'Teléfono', keyboardType: TextInputType.phone),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para guardar el registro
              },
              child: Text('Guardar Registro'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF004455), // Botón con color personalizado.
                padding: EdgeInsets.symmetric(vertical: 16), // Mejora el tamaño del botón.
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para construir un campo de texto
  Widget _buildTextField(TextEditingController controller, String label, {TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }

  // Método para construir el campo del Dropdown
  Widget _buildDropdownField() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Tipo de Documento',
        border: OutlineInputBorder(),
      ),
      value: selectedDocumentType,
      items: documentTypes.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedDocumentType = newValue;
        });
      },
    );
  }
}
