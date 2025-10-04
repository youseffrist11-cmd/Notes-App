part of 'create_note_bloc.dart';

@immutable
sealed class CreateNoteEvent extends Equatable {
  const CreateNoteEvent();
  @override
  List<Object?> get props => [];
}

class SupmitCreateNoteEvent extends CreateNoteEvent {
  final NoteModel note;
  const SupmitCreateNoteEvent(this.note);
  @override
  List<Object?> get props => [note];
}

class EditCreateNoteEvent extends CreateNoteEvent {
  final String noteId;
  final NoteModel updatedNote;

  EditCreateNoteEvent({required this.noteId, required this.updatedNote});
  @override
  List<Object?> get props => [noteId, updatedNote];
}
