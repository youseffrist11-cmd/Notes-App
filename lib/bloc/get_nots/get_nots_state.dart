part of 'get_nots_bloc.dart';

sealed class GetNotsState {}

final class GetNotsInitial extends GetNotsState {}

final class GetNotsLoading extends GetNotsState {}

final class GetNotsLoaded extends GetNotsState {
  final List<NoteModel> notes;
  GetNotsLoaded(this.notes);
}

final class GetNotsFailure extends GetNotsState {
  final String errorMessage;
  GetNotsFailure(this.errorMessage);
}
