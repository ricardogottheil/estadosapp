import 'package:estadosapp/bloc/user/user_bloc.dart';
import 'package:estadosapp/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 1'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              final userBloc =
                  BlocProvider.of<UserBloc>(context, listen: false);
              userBloc.add(DeleteUser());
            },
          ),
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return state.existUser
              ? InformacionUsuario(user: state.user!)
              : const Center(child: Text('No hay usuario seleccionado'));

          /*if (state is UserInitialState) {
            return const Center(
              child: Text('No hay usuario seleccionado'),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }*/
        },
      ),
      //const InformacionUsuario(),
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
  final Usuario user;
  const InformacionUsuario({
    Key? key,
    required this.user,
  }) : super(key: key);

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
              title: Text('Nombre: ${user.nombre}'),
            ),
            ListTile(
              title: Text('Edad: ${user.edad}'),
            ),
            const Text(
              'Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            if (user.profesiones.isNotEmpty)
              ...user.profesiones.map((profesion) {
                return ListTile(
                  title: Text(profesion),
                );
              }),
          ],
        ));
  }
}
