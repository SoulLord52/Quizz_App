import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/Auth/SignUp.dart';
import 'package:toastification/toastification.dart';

import '../Cubit/HomeCubit.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool darkModeEnabled = true;
  bool notificationsEnabled = true;
  bool feedBackEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF101622),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back, color: Color(0XFF135BEC), size: 34),
        ),
        title: Text(
          "Settings",
          style: GoogleFonts.workSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(color: Colors.grey.shade900),
              Text(
                "Account",
                style: GoogleFonts.workSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0XFF94A3B8),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0XFF101827),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0XFF135BEC).withOpacity(.15),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0XFF135BEC).withOpacity(.20),
                                blurRadius: 20,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Icon(
                            CupertinoIcons.mail,
                            size: 24,
                            color: Color(0XFF135BEC),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Edit Email",
                          style: GoogleFonts.workSans(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 20,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0XFF135BEC).withOpacity(.15),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0XFF135BEC).withOpacity(.20),
                                blurRadius: 20,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Icon(
                            CupertinoIcons.lock,
                            size: 24,
                            color: Color(0XFF135BEC),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Change Password",
                          style: GoogleFonts.workSans(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0XFF135BEC).withOpacity(.15),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0XFF135BEC).withOpacity(.20),
                                blurRadius: 20,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Icon(
                            CupertinoIcons.chart_bar_square,
                            size: 24,
                            color: Color(0XFF135BEC),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Git Hub integration",
                          style: GoogleFonts.workSans(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Preferences",
                style: GoogleFonts.workSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0XFF94A3B8),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0XFF101827),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0XFF135BEC).withOpacity(.15),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0XFF135BEC).withOpacity(.20),
                                blurRadius: 20,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Icon(
                            CupertinoIcons.moon,
                            size: 24,
                            color: Color(0XFF135BEC),
                          ),
                        ),

                        SizedBox(width: 10),

                        Text(
                          "Dark Mode",
                          style: GoogleFonts.workSans(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        Spacer(),

                        Switch(
                          value: darkModeEnabled,
                          onChanged: (value) {
                            setState(() {
                              darkModeEnabled = value;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0XFF135BEC).withOpacity(.15),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0XFF135BEC).withOpacity(.20),
                                blurRadius: 20,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Icon(
                            CupertinoIcons.bell,
                            size: 24,
                            color: Color(0XFF135BEC),
                          ),
                        ),

                        SizedBox(width: 10),

                        Text(
                          "Notifications",
                          style: GoogleFonts.workSans(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        Spacer(),

                        Switch(
                          value: notificationsEnabled,
                          onChanged: (value) {
                            setState(() {
                              notificationsEnabled = value;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0XFF135BEC).withOpacity(.15),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0XFF135BEC).withOpacity(.20),
                                blurRadius: 20,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Icon(
                            CupertinoIcons.square_favorites,
                            size: 24,
                            color: Color(0XFF135BEC),
                          ),
                        ),

                        SizedBox(width: 10),

                        Text(
                          "Haptick Feedback",
                          style: GoogleFonts.workSans(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        Switch(
                          value: feedBackEnabled,
                          onChanged: (value) {
                            setState(() {
                              feedBackEnabled = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "About",
                style: GoogleFonts.workSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0XFF94A3B8),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0XFF101827),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0XFF135BEC).withOpacity(.15),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0XFF135BEC).withOpacity(.20),
                                blurRadius: 20,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Icon(
                            CupertinoIcons.shield_lefthalf_fill,
                            size: 24,
                            color: Color(0XFF135BEC),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Privacy Policy",
                          style: GoogleFonts.workSans(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 20,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0XFF135BEC).withOpacity(.15),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0XFF135BEC).withOpacity(.20),
                                blurRadius: 20,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Icon(
                            CupertinoIcons.question_diamond,
                            size: 24,
                            color: Color(0XFF135BEC),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Terms & Conditions",
                          style: GoogleFonts.workSans(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0XFF135BEC).withOpacity(.15),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0XFF135BEC).withOpacity(.20),
                                blurRadius: 20,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Icon(
                            CupertinoIcons.info,
                            size: 24,
                            color: Color(0XFF135BEC),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "App Versions",
                          style: GoogleFonts.workSans(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              OutlinedButton(
                onPressed: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (dialogContext) => CupertinoAlertDialog(
                      title: Text(
                        "Confirm to delete",
                        style: GoogleFonts.workSans(fontSize: 18),
                      ),
                      content: Text(
                        "This action cannot be undone.",
                        style: GoogleFonts.workSans(fontSize: 16, color: Colors.red),
                      ),
                      actions: [
                        ValueListenableBuilder(
                          valueListenable: isAccountDeleting,

                          builder: (context, value, child) {
                            return CupertinoDialogAction(
                              onPressed: value
                                  ? null
                                  : () {
                                      isAccountDeleting.value = true;

                                      context.read<HomeCubit>().deleteAccount(
                                        onDeleted: () {
                                          isAccountDeleting.value = false;

                                          Navigator.pop(dialogContext);

                                          toastification.show(
                                            type: ToastificationType.info,

                                            title: Text(
                                              "Your account has been deleted!",
                                              style: GoogleFonts.workSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },

                              child: value
                                  ? CupertinoActivityIndicator()
                                  : Text(
                                      "Yes",
                                      style: GoogleFonts.workSans(
                                        color: Colors.red,
                                        fontSize: 16,
                                      ),
                                    ),
                            );
                          },
                        ),

                        CupertinoDialogAction(
                          onPressed: () {
                            Navigator.pop(dialogContext);
                          },

                          child: Text(
                            "No",
                            style: GoogleFonts.workSans(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Color(0xff2A1418),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(20),
                    side: BorderSide(color: Colors.redAccent),
                  ),
                  fixedSize: Size(500, 60),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout, color: Colors.red),
                    Text(
                      "Delete Account",
                      style: GoogleFonts.workSans(
                        color: Colors.red,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              OutlinedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((v) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                      (_) => false,
                    );
                  });
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Color(0xff2A1418),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(20),
                    side: BorderSide(color: Colors.redAccent),
                  ),
                  fixedSize: Size(500, 60),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout, color: Colors.red),
                    Text(
                      "Log Out",
                      style: GoogleFonts.workSans(
                        color: Colors.red,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
