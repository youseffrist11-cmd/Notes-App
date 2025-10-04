part of 'sigin_up_bloc.dart';

@immutable
abstract class SiginUpEvent {}

class SignUpRequested extends SiginUpEvent {
  final String email;
  final String password;

  SignUpRequested({required this.email, required this.password});
}
