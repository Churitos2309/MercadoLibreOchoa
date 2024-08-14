import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PaginadeRegistro extends StatefulWidget {
  const PaginadeRegistro({super.key});

  @override
  State<PaginadeRegistro> createState() => _PaginadeRegistroState();
}

class _PaginadeRegistroState extends State<PaginadeRegistro> {
  final _formKey = GlobalKey<FormState>();
  String txtNombres = ""; 
  String txtEmail = "";
  String txtPassword = "";

  Future<void> _registerUser() async {
    final url =
        Uri.parse('https://apimercadolibreochoa.onrender.com/api/users');
    final data = {
      'nombre': txtNombres,
      'email': txtEmail,
      'password': txtPassword,
    };
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'data': data}),
    );

    if (response.statusCode == 201) {
      // Nos aseguramos de que el widget aun este montado antes de mostrar el mensaje.
      // si el widget se ha eliminado, la condicion 'mounted' sera 'false' y no se mostrara el mensaje
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registro exitoso')),
          // Si el servidor devuelve un 201 CREATED, se muestra un mensaje de éxito.
        );
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error al registrar el usuario')),
        );
      }
      // Si el servidor no devuelve un 201 CREATED, se lanza una excepción.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.network(
                    "https://cdn-icons-png.flaticon.com/128/758/758669.png",
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    "Ir a registrarse..",
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    "Crear una nueva cuenta",
                  ),
                  const SizedBox(height: 24.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Nombre completo",
                      prefixIcon: const Icon(Icons.person_3_rounded),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Ingrese nombre completo";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      txtNombres = value!;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: const Icon(Icons.email_sharp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Ingrese email";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      txtEmail = value!;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Ingrese password";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      txtPassword = value!;
                    },
                  ),
                  const SizedBox(height: 24.0),
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Validar el formulario
                          _formKey.currentState!
                              .save(); // Guardar el formulario si es válido
                          _registerUser(); // Llamar a la función para registrar el usuario
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          )),
                      child: const Text("Registrarse"),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Tienes una cuenta?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/inicio');
                        },
                        child: const Text(
                          "Iniciar sesión",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
