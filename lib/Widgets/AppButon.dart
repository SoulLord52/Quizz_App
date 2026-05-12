import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.onTap, required this.text});
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
          backgroundColor: Color(0XFF135BEC),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(20),
              side: BorderSide(color: Color(0XFF135BEC),)),
          fixedSize: Size(500, 60)),
      child: Text(
        text,
        style: GoogleFonts.workSans(color: Colors.white, fontSize: 20),
      ),
    );
  }
}