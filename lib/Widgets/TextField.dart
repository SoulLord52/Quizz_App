import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.prefixIcon,
  });

  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final IconData? prefixIcon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword && !isVisible,

      style: GoogleFonts.workSans(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),

      decoration: InputDecoration(
        hintText: widget.hintText,

        hintStyle: TextStyle(
          color: Colors.grey.shade500,
          fontSize: 14,
        ),

        filled: true,
        fillColor:  Color(0xff101827),

        contentPadding: EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 16,
        ),

        prefixIcon: widget.prefixIcon != null
            ? Icon(
          widget.prefixIcon,
          color: Colors.grey.shade500,
          size: 20,
        )
            : null,

        suffixIcon: widget.isPassword
            ? IconButton(
          onPressed: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
          icon: Icon(
            isVisible
                ? Icons.visibility
                : Icons.visibility_off,
            color: Colors.grey.shade500,
            size: 20,
          ),
        )
            : null,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(.05),
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.blueAccent,
            width: 1.2,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}