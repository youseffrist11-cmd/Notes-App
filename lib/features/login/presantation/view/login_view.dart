import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/sigin_in/sigin_in_bloc.dart';
import 'package:notes_app/core/helper/colors_my_app.dart';
import 'package:notes_app/features/login/presantation/view/widget/login_view_bady.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SiginInBloc(FirebaseAuth.instance),
      child: Scaffold(
        backgroundColor: ColorsMyApp.primaryColor,
        body: LoginViewBady(),
      ),
    );
  }
}
