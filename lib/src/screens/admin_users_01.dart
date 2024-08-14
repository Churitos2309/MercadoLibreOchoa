import 'package:flutter/material.dart';
import 'package:flutter_mercado_proy/src/screens/modal_users_p.dart';

class AdminUsers extends StatefulWidget {
  const AdminUsers({super.key});

  @override
  State<AdminUsers> createState() => _AdminUsersState();
}

class _AdminUsersState extends State<AdminUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[400],
        foregroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/principal');
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white)),
        title: const Text(
          "Administrar usuarios",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Image.network(
            "https://cdn-icons-png.flaticon.com/512/1535/1535024.png",
            width: 300,
            height: 300,
          ),
          const SizedBox(height: 16.0),
          Card(
            child: ListTile(
              title: const Text("Buscar usuario"),
              leading: const Icon(Icons.person_2_outlined),
              trailing: const Icon(Icons.arrow_circle_right_outlined),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 8.0),
          Card(
            child: ListTile(
              title: const Text("Usuarios"),
              leading: const Icon(Icons.connect_without_contact_rounded),
              trailing: const Icon(Icons.arrow_circle_right_outlined),
              onTap: () {
                // modalUsuario(context);
                showUsuarioP(context);
              },
            ),
          ),
          const SizedBox(height: 8.0),
          Card(
            child: ListTile(
              title: const Text("Solicitudes"),
              leading: const Icon(Icons.connect_without_contact_rounded),
              trailing: const Icon(Icons.arrow_circle_right_outlined),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 8.0),
          Card(
            child: ListTile(
              title: const Text("Informes"),
              leading: const Icon(Icons.connect_without_contact_rounded),
              trailing: const Icon(Icons.arrow_circle_right_outlined),
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}
