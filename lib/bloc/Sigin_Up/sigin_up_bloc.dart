import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sigin_up_event.dart';
part 'sigin_up_state.dart';

class SiginUpBloc extends Bloc<SiginUpEvent, SiginUpState> {
  final FirebaseAuth auth;

  SiginUpBloc(this.auth) : super(SiginUpInitial()) {
    on<SignUpRequested>((event, emit) async {
      emit(SiginUpLoading());
      try {
        await auth.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(SiginUpSuccess());
      } on FirebaseAuthException catch (e) {
        emit(SiginUpFailure(e.message ?? 'An unknown error occurred'));
      } catch (e) {
        emit(SiginUpFailure('Something went wrong. Please try again.'));
      }
    });
  }
}
