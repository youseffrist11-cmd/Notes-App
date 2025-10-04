part of 'sigin_in_bloc.dart';

@immutable
sealed class SiginInState {}

final class SiginInInitial extends SiginInState {}

final class SiginInLoading extends SiginInState {}

final class SiginInSuccess extends SiginInState {}

final class SiginInFailure extends SiginInState {
  final String errorMessage;
  SiginInFailure(this.errorMessage);
}
