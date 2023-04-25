import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: ContactsPage(),
    );
  }
}

class ContactsPage extends StatefulWidget {
  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final contacts = [
    Contact(name: "Guilherme Augusto", email: 'Guilherme@gmail.com', favorito: false),
    Contact(name: "Marcela Carvalheiro", email: 'Marcela@outlook.com',favorito: false),
    Contact(name: "Antony Garrido", email: 'Antony@gmail.com',favorito: false),
    Contact(name: "Matheus Palma", email: 'Matheus@gmail.com',favorito: false),
    Contact(name: "Thiago Rodrigues", email: 'Thiago@yahool.com',favorito: false),
  ];

  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos: ' + '$contador'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: 
                NetworkImage("https://i.pravatar.cc/150?img=$index"),
                ),
            title: Text(contacts[index].name),
            subtitle: Text(contacts[index].email),
            trailing: IconButton(
             onPressed: () {
                setState(() {
                  if (contacts[index].favorito) {
                    contador--;
                  } else {
                    contador++;
                  }
                  contacts[index].favorito = !contacts[index].favorito;
                });
              },
              icon: contacts[index].favorito ? Icon(Icons.favorite, color: Colors.red) : Icon(Icons.favorite_border, color: Colors.grey),
              
              ),
            );
        },
      ),
    );
  }
}

class Contact {
  String name;
  String email;
  bool favorito;

  Contact({required this.name, required this.email, required this.favorito });
}
