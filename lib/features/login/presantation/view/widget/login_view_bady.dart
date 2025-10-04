import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/sigin_in/sigin_in_bloc.dart';
import 'package:notes_app/features/Home_page/presantation/view/home_view.dart';
import 'package:notes_app/features/login/presantation/view/widget/CoustomTextButton_with_google.dart';
import 'package:notes_app/features/login/presantation/view/widget/CoustomTextField.dart';
import 'package:notes_app/features/login/presantation/view/widget/Coustom_Text_Button.dart';
import 'package:notes_app/features/login/presantation/view/widget/Coustom_Text_Top_Bage.dart';
import 'package:notes_app/features/login/presantation/view/widget/Dont_Have_An_Account.dart';

class LoginViewBady extends StatelessWidget {
  const LoginViewBady({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return BlocListener<SiginInBloc, SiginInState>(
      listener: (context, state) {
        if (state is SiginInLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => Center(child: CircularProgressIndicator()),
          );
        } else if (state is SiginInSuccess) {
          Navigator.of(context).pop(); // لإغلاق الـ CircularProgressIndicator
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Login Successful')));

          // 👇 التنقل إلى الصفحة الرئيسية بعد تسجيل الدخول
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeView()),
          );
        } else if (state is SiginInFailure) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login Failed: ${state.errorMessage}')),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CoustomTextTopBage(name: 'Hi, Welcome Back!'),
                    CoustomTextFieldSiginIn(
                      controller: emailController,
                      hintText: 'example@gmail.com',
                      name: 'Email',
                    ),
                    const SizedBox(height: 20),
                    CoustomTextFieldSiginIn(
                      controller: passwordController,
                      hintText: 'Enter Your Password',
                      name: 'Password',
                    ),
                    const SizedBox(height: 40),
                    CoustomTextButton(
                      name: 'Login',
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                    const SizedBox(height: 20),
                    CoustomtextbuttonWithGoogle(name: 'Countinue with Google'),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),

            const DontHaveAnAccount(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
