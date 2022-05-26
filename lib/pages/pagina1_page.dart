import 'package:estadosapp/models/usuario.dart';
import 'package:estadosapp/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 1'),
      ),
      body: StreamBuilder<Usuario>(
          stream: usuarioService.usuarioStream,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? InformacionUsuario(usuario: snapshot.data!)
                : const Center(
                    child: Text('No hay informacion del usuario'),
                  );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        },
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  const InformacionUsuario({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  final Usuario usuario;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            ListTile(
              title: Text('Nombre: ${usuario.nombre}'),
            ),
            ListTile(
              title: Text('Edad: ${usuario.edad}'),
            ),
            const Text(
              'Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            const ListTile(
              title: Text('Profesion 1'),
            ),
            const ListTile(
              title: Text('Profesion 1'),
            ),
            const ListTile(
              title: Text('Profesion 1'),
            ),
          ],
        ));
  }
}
