import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Personas> _personas = [
    Personas("Josué", "Diaz", "+51 993 432 464"),
    Personas("David", "Morán", "+51 321 512 313"),
    Personas("Joska", "Martinez", "+51 945 512 613"),
    Personas("Andres", "Huaman", "+51 924 512 913"),
    Personas("Tania", "Morán", "+51 931 712 313"),
    Personas("Andrea", "Diaz", "+51 991 518 323"),
    Personas("Lisbeth", "Morán", "+51 901 546 338"),
    Personas("Maria", "Garamendi", "+51 921 213 513"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Contactos'),
          ),
          body: ListView.builder(
              itemCount: _personas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onLongPress: () {
                    this._borrarPersona(context, _personas[index]);
                  },
                  title: Text(
                      _personas[index].name + ' ' + _personas[index].lastname),
                  subtitle: Text(_personas[index].phone),
                  leading: CircleAvatar(
                    child: Text(_personas[index].name.substring(0, 1)),
                  ),
                  trailing: Icon(Icons.arrow_back_ios),
                );
              })),
    );
  }

  _borrarPersona(context, Personas personas) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Eliminar Contacto"),
              content: Text(
                  "¿Está seguro de querer eliminar a " + personas.name + '?'),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      print(personas);
                      Navigator.pop(context);
                    },
                    child: Text("Cancelar")),
                ElevatedButton(
                    onPressed: () {
                      print(personas.name);
                      this.setState(() {
                        this._personas.remove(personas);
                      });
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Borrar",
                      style: TextStyle(color: Colors.red),
                    )),
              ],
            ));
  }
}

class Personas {
  late String name;
  late String lastname;
  late String phone;

  Personas(name, lastname, phone) {
    this.name = name;
    this.lastname = lastname;
    this.phone = phone;
  }
}
