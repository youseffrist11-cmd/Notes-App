import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/Sigin_Up/sigin_up_bloc.dart';
import 'package:notes_app/features/Home_page/presantation/view/home_view.dart';
import 'package:notes_app/features/login/presantation/view/login_view.dart';
import 'package:notes_app/features/login/presantation/view/widget/Coustom_Text_Top_Bage.dart';
import 'package:notes_app/features/sigin_up/presantation/view/widget/CoustomTextButton_sigin_up.dart';
import 'package:notes_app/features/sigin_up/presantation/view/widget/CoustomTextField_sign_Up.dart';

class SiginUpViewBady extends StatelessWidget {
  const SiginUpViewBady({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return BlocListener<SiginUpBloc, SiginUpState>(
      listener: (context, state) {
        if (state is SiginUpLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        } else if (state is SiginUpSuccess) {
          Navigator.of(context).pop(); // لإغلاق الـ CircularProgressIndicator
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Account created successfully')),
          );

          // 👇 بعد إنشاء الحساب، ننتقل إلى الصفحة الرئيسية مباشرة
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeView()),
          );
        } else if (state is SiginUpFailure) {
          if (Navigator.canPop(context)) Navigator.of(context).pop();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CoustomTextTopBage(name: 'Create New Account'),
              CoustomtextfieldSignUp(
                controller: emailController,
                hintText: 'example@gmail.com',
                name: 'Email',
              ),
              const SizedBox(height: 20),
              CoustomtextfieldSignUp(
                controller: passwordController,
                hintText: 'Enter Your Password',
                name: 'Password',
              ),
              const SizedBox(height: 40),
              CoustomtextbuttonSiginUp(
                name: 'Sign Up',
                emailController: emailController,
                passwordController: passwordController,
              ),
              const SizedBox(height: 20),
              CoustomtextbuttonSiginUp(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const LoginView()),
                  );
                },
                name: 'Log in now',
                emailController: emailController,
                passwordController: passwordController,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
