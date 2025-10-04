import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/create_note/create_note_bloc.dart';
import 'package:notes_app/features/create_note/presantation/view/widget/CoustomTextTopBage.dart';
import 'package:notes_app/features/create_note/presantation/view/widget/Coustom_Text_Button.dart';
import 'package:notes_app/features/create_note/presantation/view/widget/coustom_Add_Note.dart';
import 'package:notes_app/model/note_model.dart';

class CreateNoteViewBady extends StatefulWidget {
  const CreateNoteViewBady({super.key, this.existingNote});
  final NoteModel? existingNote;

  @override
  State<CreateNoteViewBady> createState() => _CreateNoteViewBadyState();
}

class _CreateNoteViewBadyState extends State<CreateNoteViewBady> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController headlinController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    return BlocConsumer<CreateNoteBloc, CreateNoteState>(
      listener: (context, state) {
        if (state is CreateNoteLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => Center(child: CircularProgressIndicator()),
          );
        } else if (state is CreateNoteSuccess) {
          Navigator.of(context).pop();

          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Note saved successfully')));
          Navigator.of(context).pop();
        } else if (state is CreateNoteFailure) {
          Navigator.of(context).pop();

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to save note: ${state.errorMessage}'),
            ),
          );
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 42),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 120),
                CoustomTextTopBageCrate(name: 'Create Note'),
                SizedBox(height: 17),
                coustomAddNote(
                  controller: headlinController,
                  maxLines: 1,
                  hintText: 'Enter Note Address',
                  name: 'Head line',
                ),
                SizedBox(height: 17),
                coustomAddNote(
                  controller: descriptionController,
                  maxLines: 7,
                  hintText: 'Enter Your Description',
                  name: 'Description',
                ),
                SizedBox(height: 17),
                Center(child: CoustomTextButtonNewNote(name: 'Select Media')),
                SizedBox(height: 9),
                Center(
                  child: CoustomTextButtonNewNote(
                    onPressed: () {
                      if (headlinController.text.isEmpty ||
                          descriptionController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please fill in all fields')),
                        );
                        return;
                      }
                      final newNote = NoteModel(
                        headline: headlinController.text,
                        description: descriptionController.text,
                        createdAt:
                            widget.existingNote?.createdAt ?? DateTime.now(),
                      );
                      if (widget.existingNote != null &&
                          widget.existingNote != null) {
                        context.read<CreateNoteBloc>().add(
                          EditCreateNoteEvent(
                            noteId: widget.existingNote!.id!.toString(),
                            updatedNote: newNote,
                          ),
                        );
                      } else {
                        context.read<CreateNoteBloc>().add(
                          SupmitCreateNoteEvent(newNote),
                        );
                      }
                    },
                    name: widget.existingNote == null ? 'Create' : 'Updata',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
