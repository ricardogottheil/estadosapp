import 'dart:async';

import 'package:estadosapp/models/usuario.dart';

class _UsuarioService {
  Usuario? _usuario;
  final StreamController<Usuario> _usuarioStreamController =
      StreamController<Usuario>.broadcast();

  Usuario? get usuario => _usuario;

  bool get existeUsuario => (_usuario != null) ? true : false;

  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;

  void setUsuario(Usuario usuario) {
    _usuario = usuario;
    _usuarioStreamController.add(_usuario!);
  }

  void setEdad(int edad) {
    if (existeUsuario) {
      _usuario!.edad = edad;
      _usuarioStreamController.add(_usuario!);
    }
  }

  void dispose() {
    _usuarioStreamController.close();
  }
}

final usuarioService = _UsuarioService();
