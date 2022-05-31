part of 'usuario_cubit.dart';

@immutable
abstract class UsuarioState {}

class UsuarioInitial extends UsuarioState {
  final existeUsuario = false;

  @override
  String toString() {
    return 'UsuarioInitial => existeUsuario: false';
  }
}

class UsuarioSelected extends UsuarioState {
  final existeUsuario = true;
  final Usuario usuario;

  UsuarioSelected(this.usuario);

  @override
  String toString() {
    return 'UsuarioSelected => usuario: $usuario';
  }
}
