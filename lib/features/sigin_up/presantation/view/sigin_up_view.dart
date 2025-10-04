import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/Sigin_Up/sigin_up_bloc.dart';
import 'package:notes_app/core/helper/colors_my_app.dart';
import 'package:notes_app/features/sigin_up/presantation/view/widget/sigin_up_view_bady.dart';

class SiginUpView extends StatelessWidget {
  const SiginUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SiginUpBloc(FirebaseAuth.instance),
      child: Scaffold(
        backgroundColor: ColorsMyApp.primaryColor,
        body: const SiginUpViewBady(),
      ),
    );
  }
}
