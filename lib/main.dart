import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/Home/HomeScreen.dart';
import 'package:quizz_app/firebase_options.dart';
import 'package:toastification/toastification.dart';

import 'Auth/SignUp.dart';
import 'Cubit/AuthCubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AuthCubit())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snap) {
        return ToastificationWrapper(
          child: MaterialApp(
            title: 'Firebase auth',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Color(0XFF101622),
              colorScheme: ColorScheme.light()
            ),
            home: snap.hasData ? HomeScreen() : SignUp(),
          ),
        );
      }
    );
  }
}

