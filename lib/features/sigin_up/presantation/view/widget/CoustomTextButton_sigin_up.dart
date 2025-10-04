import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/Sigin_Up/sigin_up_bloc.dart';

class CoustomtextbuttonSiginUp extends StatelessWidget {
  const CoustomtextbuttonSiginUp({
    super.key,
    required this.name,
    required this.emailController,
    required this.passwordController,
    this.onPressed,
  });

  final String name;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextButton(
        onPressed: () {
          onPressed?.call();
          final email = emailController.text.trim();
          final password = passwordController.text.trim();
          if (email.isNotEmpty && password.isNotEmpty) {
            context.read<SiginUpBloc>().add(
              SignUpRequested(email: email, password: password),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please enter both email and password'),
              ),
            );
          }
        },
        child: Center(
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
