import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/create_note/create_note_bloc.dart';
import 'package:notes_app/core/helper/colors_my_app.dart';
import 'package:notes_app/features/create_note/presantation/view/widget/create_note_view_bady.dart';

class CreateNoteView extends StatelessWidget {
  const CreateNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateNoteBloc(),
      child: Scaffold(
        backgroundColor: ColorsMyApp.primaryColor,
        body: CreateNoteViewBady(),
      ),
    );
  }
}
