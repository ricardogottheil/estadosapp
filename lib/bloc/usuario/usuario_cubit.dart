import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estadosapp/models/usuario.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());

  void establecerUsuario(Usuario usuario) {
    emit(UsuarioSelected(usuario));
  }

  void cambiarEdad(int edad) {
    final currentState = state;

    if (currentState is UsuarioSelected) {
      emit(UsuarioSelected(currentState.usuario.copyWith(edad: edad)));
    }
  }

  void agregarProfesion() {
    final currentState = state;

    if (currentState is UsuarioSelected) {
      emit(UsuarioSelected(currentState.usuario.copyWith(
        profesiones: List.from(currentState.usuario.profesiones)
          ..add('Profesion ${currentState.usuario.profesiones.length + 1}'),
      )));
    }
  }

  void borrarUsuario() {
    emit(UsuarioInitial());
  }
}
