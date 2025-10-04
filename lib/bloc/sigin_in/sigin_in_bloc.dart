import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sigin_in_event.dart';
part 'sigin_in_state.dart';

class SiginInBloc extends Bloc<SiginInEvent, SiginInState> {
  final FirebaseAuth auth;

  SiginInBloc(this.auth) : super(SiginInInitial()) {
    on<SignInRequested>((event, emit) async {
      emit(SiginInLoading());
      try {
        await auth.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(SiginInSuccess());
      } on FirebaseAuthException catch (e) {
        emit(SiginInFailure(e.message ?? 'An unknown error occurred'));
      } catch (e) {
        emit(SiginInFailure('Something went wrong. Please try again.'));
      }
    });
  }
}
