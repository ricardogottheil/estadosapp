import 'package:flutter/material.dart';

import 'package:estadosapp/models/usuario.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUser>(
      (event, emit) => emit(UserSetState(event.user)),
    );

    on<ChangeUserAge>((event, emit) {
      if (!state.existUser) return;
      final changeUser = state.user!.copyWith(edad: event.age);
      emit(UserSetState(changeUser));
    });

    on<AddUserProfession>((event, emit) {
      if (!state.existUser) return;
      final addProfession = state.user!.copyWith(
        profesiones: state.user!.profesiones
          ..add('Profesion ${state.user!.profesiones.length + 1} '),
      );
      emit(UserSetState(addProfession));
    });

    on<DeleteUser>((event, emit) {
      if (!state.existUser) return;
      emit(const UserInitialState());
    });
  }
}
