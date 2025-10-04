part of 'get_nots_bloc.dart';

sealed class GetNotsEvent {}

final class loadNotesEvent extends GetNotsEvent {}

final class GetNotsEventDeleteNote extends GetNotsEvent {
  final String noteId;
  GetNotsEventDeleteNote(this.noteId);
}

final class GetNotsEventUpdateNote extends GetNotsEvent {
  final NoteModel note;
  GetNotsEventUpdateNote(this.note);
}
