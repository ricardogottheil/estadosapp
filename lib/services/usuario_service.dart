import 'package:flutter/material.dart';

import 'package:estadosapp/models/usuario.dart';

class UsuarioService with ChangeNotifier {
  Usuario? _usuario;

  Usuario? get usuario => _usuario;

  bool get existeUsuario => _usuario != null ? true : false;

  set usuario(Usuario? usuario) {
    if (usuario != null) {
      _usuario = usuario;
      notifyListeners();
    }
  }

  void cambiarEdad(int edad) {
    if (existeUsuario) {
      _usuario!.edad = edad;
      notifyListeners();
    }
  }

  void agregarProfesion() {
    if (existeUsuario) {
      _usuario?.profesiones
          ?.add("Profesion ${_usuario!.profesiones!.length + 1}");
      notifyListeners();
    }
  }

  void removerUsuario() {
    _usuario = null;
    notifyListeners();
  }
}
