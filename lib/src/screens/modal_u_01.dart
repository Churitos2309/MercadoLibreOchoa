import 'package:flutter/material.dart';
import 'package:flutter_mercado_proy/src/controllers/users_controller.dart';

// void showUsuario(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     builder: (context) {
//       return Container(
//         height: 200,
//         child: Center(
//           child: Text('Este es un modal básico'),
//         ),
//       );
//     },
//   );
// }

void showUsuario(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return FutureBuilder<List<Users>>(
        future: consultUsers(),
        initialData: const [],
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(snapshot.data![index].nombre ?? ''),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Aquí puedes agregar la lógica para actualizar el usuario
                          
                        },
                        icon: Icon(Icons.update_rounded),
                        color: Color.fromARGB(255, 255, 139, 7),
                      ),
                      IconButton(
                        onPressed: () {
                          // Aquí puedes agregar la lógica para eliminar el usuario
                        },
                        icon: Icon(Icons.delete_rounded, color: Colors.red),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      );
    },
  );
}