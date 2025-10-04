import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/model/note_model.dart';

part 'create_note_event.dart';
part 'create_note_state.dart';

class CreateNoteBloc extends Bloc<CreateNoteEvent, CreateNoteState> {
  CreateNoteBloc() : super(CreateNoteInitial()) {
    on<SupmitCreateNoteEvent>((event, emit) async {
      emit(CreateNoteLoading());
      try {
        await FirebaseFirestore.instance
            .collection("notes")
            .add(event.note.toJson());
        emit(CreateNoteSuccess());
      } catch (e) {
        emit(CreateNoteFailure(e.toString()));
      }
    });
    on<EditCreateNoteEvent>((event, emit) async {
      emit(CreateNoteLoading());
      try {
        await FirebaseFirestore.instance
            .collection("notes")
            .doc(event.noteId)
            .update(event.updatedNote.toJson());
        emit(CreateNoteSuccess());
      } catch (e) {
        emit(CreateNoteFailure(e.toString()));
      }
    });
  }
}
