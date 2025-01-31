import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mercado Libre Col',
      theme: ThemeData(
        primaryColor: const Color(0xFF7A288A), // Violeta oscuro
        colorScheme: const ColorScheme(
          primary: Color(0xFF7A288A), 
          secondary: Color(0xFFC7B8EA), 
          surface: Color(0xFFE5E5EA), 
          error: Colors.red, 
          onPrimary: Colors.white, 
          onSecondary: Colors.black, 
          onSurface: Colors.black, 
          onError: Colors.white, brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFFE5E5EA), // Fondo claro
      ),
      home: const MenuPrincipal(),
    );
  }
}

class MenuPrincipal extends StatefulWidget {
  const MenuPrincipal({super.key});

  @override
  MenuPrincipalState createState() => MenuPrincipalState();
}

class MenuPrincipalState extends State<MenuPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Mercado Libre Col", style: TextStyle(fontSize: 18)),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/inicio');
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Colors.white,
              ),
              child: const Text("Iniciar sesión"),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor),
                      hintText: "Buscar Producto",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border, color: Theme.of(context).primaryColor),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/AdminUsers');
                  },
                  icon: Icon(Icons.connect_without_contact_rounded, color: Theme.of(context).primaryColor),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Número de columnas
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 2.0,
                    margin: const EdgeInsets.all(5),
                    child: InkWell(
                      onTap: () {
                        // Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(categories[index]['icono'], color: Theme.of(context).primaryColor),
                            const SizedBox(width: 10),
                            Text(
                              categories[index]['titulo'],
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12.0, color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30.0, color: Theme.of(context).primaryColor),
              label: "Inicio"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shop, size: 30.0, color: Theme.of(context).primaryColor),
              label: "Compra"),
          BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app_sharp, size: 30.0, color: Theme.of(context).primaryColor),
              label: "Salir"),
        ],
      ),
    );
  }
}

///////////////////////
final List<Map<String, dynamic>> categories = [
  {'codigo': '001', 'icono': Icons.home, 'titulo': 'Hogares y muebles'},
  {'codigo': '002', 'icono': Icons.phone_android, 'titulo': 'Celulares'},
  {'codigo': '003', 'icono': Icons.checkroom, 'titulo': 'Ropa y accesorios'},
  {'codigo': '004', 'icono': Icons.computer, 'titulo': 'Computación'},
  {'codigo': '005', 'icono': Icons.kitchen, 'titulo': 'Electro Hogar'},
  {'codigo': '006', 'icono': Icons.sports_soccer, 'titulo': 'Deportes'},
  {'codigo': '007', 'icono': Icons.build, 'titulo': 'Herramientas'},
  {'codigo': '008', 'icono': Icons.brush, 'titulo': 'Belleza'},
  {'codigo': '009', 'icono': Icons.tv, 'titulo': 'Electrónica y audio'},
  {'codigo': '010', 'icono': Icons.fastfood, 'titulo': 'Alimentos y bebidas'},
  {'codigo': '011', 'icono': Icons.pets, 'titulo': 'Animales y mascotas'},
];
