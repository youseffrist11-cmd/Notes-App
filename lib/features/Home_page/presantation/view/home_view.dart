import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/helper/colors_my_app.dart';
import 'package:notes_app/features/Home_page/presantation/view/widget/home_view_bady.dart';
import 'package:notes_app/bloc/get_nots/get_nots_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetNotsBloc()..add(loadNotesEvent()),
      child: Scaffold(
        backgroundColor: ColorsMyApp.primaryColor,
        body: HomeViewBady(),
      ),
    );
  }
}
