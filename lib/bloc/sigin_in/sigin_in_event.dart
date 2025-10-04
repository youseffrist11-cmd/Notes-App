part of 'sigin_in_bloc.dart';

@immutable
sealed class SiginInEvent {}

class SignInRequested extends SiginInEvent {
  final String email;
  final String password;

  SignInRequested({required this.email, required this.password});
}
