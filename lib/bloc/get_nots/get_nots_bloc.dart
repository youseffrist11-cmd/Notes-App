import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_app/model/note_model.dart';

part 'get_nots_event.dart';
part 'get_nots_state.dart';

class GetNotsBloc extends Bloc<GetNotsEvent, GetNotsState> {
  GetNotsBloc() : super(GetNotsInitial()) {
    on<loadNotesEvent>((event, emit) async {
      emit(GetNotsLoading());
      try {
        final snapShot = await FirebaseFirestore.instance
            .collection('notes')
            .get();
        final notes = snapShot.docs
            .map((doc) => NoteModel.fromJson(doc.data()))
            .toList();
        emit(GetNotsLoaded(notes));
      } catch (e) {
        print(e);
        emit(GetNotsFailure(e.toString()));
      }
    });
    on<GetNotsEventDeleteNote>((event, emit) async {
      try {
        await FirebaseFirestore.instance
            .collection('notes')
            .doc(event.noteId)
            .delete();
        add(loadNotesEvent());
      } catch (e) {
        print(e);
        emit(GetNotsFailure(e.toString()));
      }
    });
    on<GetNotsEventUpdateNote>((event, emit) async {
      try {
        await FirebaseFirestore.instance
            .collection('notes')
            .doc(event.note.id.toString())
            .update(event.note.toJson());
        add(loadNotesEvent());
      } catch (e) {
        print(e);
        emit(GetNotsFailure(e.toString()));
      }
    });
  }
}
