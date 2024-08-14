import 'package:flutter/material.dart';
import 'package:flutter_mercado_proy/src/controllers/users_controller.dart';

class PaginadeRegistro extends StatefulWidget {
  const PaginadeRegistro({super.key});

  @override
  State<PaginadeRegistro> createState() => _PaginadeRegistroState();
}

class _PaginadeRegistroState extends State<PaginadeRegistro> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _clearControllers() {
    _nombreController.clear();
    _emailController.clear();
    _passwordController.clear();
  }

  void _navigateToLogin() {
    Navigator.pushNamed(context, '/inicio');
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
                      /*  */
                      "Ir a registrarse..",
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      "Crear una nueva cuenta",
                    ),
                    const SizedBox(height: 24.0),
                    TextFormField(
                      controller: _nombreController,
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
                    ),
                    const SizedBox(height: 12.0),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon: const Icon(Icons.email_sharp),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "recordar password",
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    SizedBox(
                      width: double.infinity,
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(
                              () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  setState(() {
                                    createUsers(
                                      _nombreController.text,
                                      _emailController.text,
                                      _passwordController.text,
                                    );
                                  });
                                }
                              },
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Registro exitoso')),
                            );
                            _clearControllers();
                            _navigateToLogin();
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
                )),
          ),
        ),
      ),
    );
  }
}
