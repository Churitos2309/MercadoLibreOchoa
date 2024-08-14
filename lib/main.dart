import 'package:flutter/material.dart';
import 'package:flutter_mercado_proy/src/screens/admin_users_01.dart';
import 'package:flutter_mercado_proy/src/screens/inicio_sesion_02.dart';
import 'package:flutter_mercado_proy/src/screens/menu_principal_05.dart';
import 'package:flutter_mercado_proy/src/screens/registro_usuario_03.dart';

void main(List<String> args) {
  runApp(const ProyectoMercadoLibre());
}

class ProyectoMercadoLibre extends StatelessWidget {
  const ProyectoMercadoLibre({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PaginadeInicio(),
      // home: const AdminUsers(),
      routes: {
        '/principal': (context) => const MenuPrincipal(),
        '/registro': (context) => const PaginadeRegistro(),
        '/inicio': (context) => const PaginadeInicio(),
        '/AdminUsers': (context) => const AdminUsers(),
        //PaginadeRegistro es el nombre de la clase
      },
    );
  }
}

///////////////////////////
