import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quizz_app/Cubit/AuthCubit.dart';
import 'package:quizz_app/Cubit/AuthState.dart';
import 'package:quizz_app/Widgets/AppButon.dart';
import 'package:quizz_app/Widgets/TextField.dart';
import 'package:quizz_app/validatos/AppValidators.dart';
import 'package:toastification/toastification.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  final phoneMask = MaskTextInputFormatter(
    mask: '##-###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
        ),
        backgroundColor: Color(0XFF101622),
        title: Text(
          "Change Password",
          style: GoogleFonts.workSans(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: BlocListener<AuthCubit, AuthState>(
          listenWhen: (previous, current) {
            return previous.runtimeType != current.runtimeType;
          },
          listener: (context, state) {
            if (state is AuthPasswordResetSuccess) {
              toastification.show(
                type: ToastificationType.success,
                title: Text(
                  "Check your email!",
                  style: GoogleFonts.workSans(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              );
            } else if (state is AuthError) {
              toastification.show(
                type: ToastificationType.error,
                title: Text(
                  state.message,
                  style: GoogleFonts.workSans(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              );
            }
          },
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Write your working email,\n to reset your password!", style: GoogleFonts.workSans(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),),
                SizedBox(height: 30,),
                CustomTextField(
                  hintText: "Enter your email!",
                  labelText: "Email",
                  controller: emailController,
                  prefixIcon: CupertinoIcons.mail,
                  validator: Validators.email,
                ),
                SizedBox(height: 30),
                AppButton(
                  onTap: () {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
                    context.read<AuthCubit>().forgotPassword(
                      email: emailController.text,
                    );
                  },
                  text: "Reset",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
