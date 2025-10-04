import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/get_nots/get_nots_bloc.dart';
import 'package:notes_app/features/Home_page/presantation/view/widget/Note_Card.dart';
import 'package:notes_app/features/Home_page/presantation/view/widget/coustom_Text_Boutton.dart';
import 'package:notes_app/features/create_note/presantation/view/create_note_view.dart';

class HomeViewBady extends StatelessWidget {
  const HomeViewBady({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CoustomTextButtonHome(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateNoteView(),
                    ),
                  );
                  context.read<GetNotsBloc>().add(loadNotesEvent());
                },
                name: "Add Note",
              ),
              const SizedBox(width: 20),
              CoustomTextButtonHome(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                name: "Log out",
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Text(
            "Your Notes",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          Expanded(
            child: BlocBuilder<GetNotsBloc, GetNotsState>(
              builder: (context, state) {
                if (state is GetNotsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GetNotsLoaded) {
                  final notes = state.notes;
                  if (notes.isEmpty) {
                    return const Center(
                      child: Text(
                        "No notes yet",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      final note = notes[index];
                      return NoteCard(
                        title: note.headline,
                        subtitle: note.description,
                        time: note.createdAt.toString().substring(0, 16),
                      );
                    },
                  );
                } else if (state is GetNotsFailure) {
                  return Center(
                    child: Text(
                      "Error: ${state.errorMessage}",
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
