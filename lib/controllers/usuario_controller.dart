import 'package:estadosapp/models/usuario.dart';
import 'package:get/get.dart';

class UsuarioController extends GetxController {
  RxBool existeUsuario = false.obs;
  Rx<Usuario> user = Usuario().obs;

  void cargarUsuario(Usuario usuario) {
    existeUsuario.value = true;
    user.value = usuario;
  }

  void actualizarEdad(int edad) {
    user.update((val) {
      val?.edad = edad;
    });
  }

  void agregarProfesion() {
    user.update((val) {
      val?.profesiones = [
        ...val.profesiones,
        'Profesion ${user.value.profesiones.length + 1}'
      ];
    });
  }
}
