import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/create_note/create_note_bloc.dart';
import 'package:notes_app/core/helper/colors_my_app.dart';
import 'package:notes_app/model/note_model.dart';

class coustomAddNote extends StatefulWidget {
  const coustomAddNote({
    super.key,
    required this.name,
    required this.hintText,
    required this.maxLines,
    required this.controller,
    this.existingNote,
    this.noteId,
  });
  final String name;
  final String hintText;
  final int maxLines;
  final TextEditingController controller;
  final NoteModel? existingNote;
  final String? noteId;

  @override
  State<coustomAddNote> createState() => _coustomAddNoteState();
}

class _coustomAddNoteState extends State<coustomAddNote> {
  final TextEditingController headlinController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (widget.existingNote != null) {
      headlinController.text = widget.existingNote!.headline;
      descriptionController.text = widget.existingNote!.description;
    }
  }

  void _sumitNote() {
    if (headlinController.text.isEmpty || descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please fill in all fields')));
      return;
    }
    final newNote = NoteModel(
      headline: headlinController.text,
      description: descriptionController.text,
      createdAt: widget.existingNote?.createdAt ?? DateTime.now(),
    );
    if (widget.existingNote != null && widget.noteId != null) {
      context.read<CreateNoteBloc>().add(
        EditCreateNoteEvent(noteId: widget.noteId!, updatedNote: newNote),
      );
    } else {
      context.read<CreateNoteBloc>().add(SupmitCreateNoteEvent(newNote));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.name, style: TextStyle(color: Colors.white, fontSize: 18)),
        SizedBox(height: 9),
        TextFormField(
          controller: widget.controller,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorsMyApp.secondaryColor,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.white),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
