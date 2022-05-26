import 'package:estadosapp/models/usuario.dart';
import 'package:estadosapp/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<Usuario>(
            stream: usuarioService.usuarioStream,
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? Text(snapshot.data!.nombre)
                  : const Text('Página 2');
            }),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final nuevoUsuario = Usuario(
                  nombre: 'Juan',
                  edad: 23,
                );

                usuarioService.setUsuario(nuevoUsuario);
              },
              color: Colors.blue,
              child: const Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                usuarioService.setEdad(30);
              },
              color: Colors.blue,
              child: const Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {},
              color: Colors.blue,
              child: const Text(
                'Añadir Profesion',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
