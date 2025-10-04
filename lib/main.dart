import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes_app/features/Home_page/presantation/view/home_view.dart';
import 'package:notes_app/features/login/presantation/view/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RootPage(),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasData) {
          return const HomeView();
        }

        return const LoginView();
      },
    );
  }
}
//تمام الحمدلله نقدر نقول خلصت المشروع بنسبه كبيره طبعا ممكن يكون فيه بعض المشاكل في التصميم او حاجه بس الفكرة الاساسية 
//وطبعا كان فيه شويه مشاكل ف الفايربيس  بس كنت بشوف حل مثلا شات جي بي تي او يوتيوب  
// وبرضو استخدام البلوك كان جديد عليا ف خد وقت حبه و لسه هياخد حبه كمان بس الحمدلله تمام 
// وطبعا لو في اي ملاحظات او حاجه قولي عليها