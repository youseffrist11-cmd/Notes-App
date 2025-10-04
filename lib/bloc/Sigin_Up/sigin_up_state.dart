part of 'sigin_up_bloc.dart';

@immutable
abstract class SiginUpState {}

class SiginUpInitial extends SiginUpState {}

class SiginUpLoading extends SiginUpState {}

class SiginUpSuccess extends SiginUpState {}

class SiginUpFailure extends SiginUpState {
  final String errorMessage;

  SiginUpFailure(this.errorMessage);
}
