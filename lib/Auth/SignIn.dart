import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/Auth/SignUp.dart';
import 'package:quizz_app/Home/HomeScreen.dart';
import 'package:toastification/toastification.dart';
import '../Cubit/AuthCubit.dart';
import '../Cubit/AuthState.dart';
import '../Widgets/AppButon.dart';
import '../Widgets/CustomAppBar.dart';
import '../Widgets/TextField.dart';
import '../service/GoogleUserService.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passWordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'assets/images/div.flex.png', isDark: true),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            toastification.show(
              type: ToastificationType.error,
              title: Text(state.message),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Text("Join the Circuit", style: GoogleFonts.workSans(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),),
                SizedBox(height: 10,),
                Text("Connect with developers solving the\nworld's toughest technical puzzles.", style: GoogleFonts.workSans(fontSize: 18,  color: Colors.grey),),
                SizedBox(height: 15,),
                CustomTextField(
                  hintText: 'Enter your email!',
                  controller: _emailController,
                  prefixIcon: CupertinoIcons.mail,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  hintText: 'Enter your password!',
                  controller: _passWordController,
                  isPassword: true,
                  prefixIcon: CupertinoIcons.lock,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      "Don't have an account?",
                      style: GoogleFonts.workSans(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                state is AuthLoading
                    ? CircularProgressIndicator()
                    : AppButton(
                        onTap: () {
                          context.read<AuthCubit>().signIn(
                            email: _emailController.text,
                            password: _passWordController.text,
                          );
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), (_) => false);
                        },
                        text: 'Sign in >',
                      ),
                SizedBox(height: 20,),
                Divider(color: Colors.grey.shade900,),
                Text("Or continue with", style: GoogleFonts.workSans(fontSize: 16, color: Colors.grey),),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Spacer(),
                  OutlinedButton(
                      onPressed: () async {
                        final user = await GoogleAuthService.signInWithGoogle(true);
                        if (user != null) {
                          debugPrint("Success: ${user.email}");
                          if (context.mounted) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => HomeScreen(),
                              ),
                            );
                          }
                        } else {
                          debugPrint("Google sign in failed");
                        }
                      },
                  style: OutlinedButton.styleFrom(
                      backgroundColor:  Color(0XFF101622),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(20),
                          side: BorderSide(color:  Color(0XFF101622),)),
                      fixedSize: Size(210, 50)),
                  child: Row(
                    children: [
                      Image.asset("assets/images/google.png", height: 35, width: 35, fit: BoxFit.cover,),
                      SizedBox(width: 10,),
                      Text("Google", style: GoogleFonts.workSans(color: Colors.white, fontSize: 16),),
                    ],
                  )
                ),
                    SizedBox(width: 20,),
                    OutlinedButton(
                        onPressed: (){},
                        style: OutlinedButton.styleFrom(
                            backgroundColor:  Color(0XFF101622),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(20),
                                side: BorderSide(color:  Color(0XFF101622),)),
                            fixedSize: Size(210, 50)),
                        child: Row(
                          children: [
                            Image.network("assets/images/github.png", height: 30, width: 30,),
                            SizedBox(width: 10,),
                            Text("Git Hub", style: GoogleFonts.workSans(color: Colors.white, fontSize: 16),),
                          ],
                        )
                    ),
                    Spacer(),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
