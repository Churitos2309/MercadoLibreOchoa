import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mercado_proy/src/screens/menu_principal_05.dart';
import 'package:http/http.dart' as http;

class PaginadeInicio extends StatefulWidget {
  const PaginadeInicio({super.key});

  @override
  State<PaginadeInicio> createState() => _PaginadeInicioState();
}

class _PaginadeInicioState extends State<PaginadeInicio> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isloading = false;
  Future<void> _login() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Por favor, ingrese un correo electrónico y contraseña"),
      ));
      return;
    }

    setState(() {
      _isloading = true;
    });

    final responselogin = await http.post(
      Uri.parse("https://apimercadolibreochoa.onrender.com/api/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "nombre": "DatoFucticio",
        "email": _emailController.text,
        "password": _passwordController.text,
      }),
    );
    // print('Respuesta status code: ${responselogin.statusCode} ');
    // print('Respuesta body: ${responselogin.body} ');

    setState(() {
      _isloading = false;
    });

    if (responselogin.statusCode == 200) {
      try {
        final jsonData = jsonDecode(responselogin.body);
        // print('jsonData: $jsonData');
        if (jsonData['token'] != null) {
          // Guardar el token en un lugar seguro
          // ...
          if (mounted) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MenuPrincipal()));
          }
        } else {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Contraseña o correo son incorrectos"),
            ));
          }
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Error al parsear la respuesta del servidor"),
          ));
        }
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Error al iniciar sesión"),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://cdn-icons-png.flaticon.com/128/758/758669.png",
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 16.0),
              const Text(
                "Bienvenido a Mercado Libre Col",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              const Text(
                "Iniciar sesión para continuar..",
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Digita Email',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isloading ? null : _login,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: _isloading
                      ? const CircularProgressIndicator()
                      : const Text("Iniciar sesión"),
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                "O inicie con ",
                style: TextStyle(color: Colors.green),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Image.network(
                    "https://cdn-icons-png.flaticon.com/128/758/758669.png",
                    height: 41,
                    width: 41,
                  ),
                  label: const Text("Logeate con Google"),
                  style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Image.network(
                    "https://cdn-icons-png.flaticon.com/128/758/758669.png",
                    height: 41,
                    width: 41,
                  ),
                  label: const Text("Logeate con Facebook"),
                  style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
              ),
              const SizedBox(height: 20.0),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Olvido su password",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/registro');
                },
                child: const Text(
                  "No tiene una cuenta? Registrarse",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
