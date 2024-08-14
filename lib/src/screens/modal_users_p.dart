import 'package:flutter/material.dart';
import 'package:flutter_mercado_proy/src/controllers/users_controller.dart';

void showUsuarioP(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          List<Users> _users = [];
          return FutureBuilder<List<Users>>(
            future: consultUsers(),
            initialData: const [],
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _users = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: _users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(_users[index].nombre ?? ''),
                      subtitle: Text(_users[index].email ?? ''),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              print('');
                              _showUpdateUser(context, _users[index], () {
                                consultUsers().then((newUserList) {
                                  setState(() {
                                    _users = newUserList;
                                  });
                                }).catchError((error) {
                                  print('Error fetching users: $error');
                                });
                              });
                            },
                            icon: Icon(Icons.update_rounded),
                            color: Color.fromARGB(255, 255, 139, 7),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete_rounded, color: Colors.red),
                            onPressed: () {
                              _showDeleteUser(context, _users[index].id ?? '', () {
                                deleteUsers(_users[index].id ?? '').then((value) {
                                  if (index >= 0 && index < _users.length) {
                                    setState(() {
                                      _users.removeAt(index);
                                    });
                                  }
                                }).catchError((error) {
                                  print("Error al eliminar usuario: $error");
                                });
                              });
                            },
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
    },
  );
}

void _showDeleteUser(
    BuildContext context, String id, VoidCallback onDeleteConfirmed) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Confirm delete'),
        content: const Text('Are you sure you want to delete the user?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              onDeleteConfirmed();
              Navigator.of(context).pop();
            },
            child: const Text('Delete'),
          ),
        ],
      );
    },
  );
}

void _showUpdateUser(
    BuildContext context, Users user, VoidCallback onUpdateUser) {
  final nombreController = TextEditingController(text: user.nombre);
  final emailController = TextEditingController(text: user.email);

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Update User'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final nombre = nombreController.text;
              final email = emailController.text;
              if (nombre.isNotEmpty && email.isNotEmpty) {
                print('Actualizando usuario...');
                updateUser(user.id!, nombre, email).then((updatedUser) {
                  print('Usuario actualizado correctamente');
                  Navigator.of(context).pop();
                  onUpdateUser();
                }).catchError((error) {
                  print('Error al actualizar un usuario: $error');
                  Navigator.of(context).pop();
                });
              } else {
                print('Error: los campos no pueden estar vacíos');
              }
            },
            child: const Text('Update'),
          ),
        ],
      );
    },
  );
}
