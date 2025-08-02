import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int? maxLines;
  final IconData? icon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const ReusableTextField({
    super.key,
    required this.controller,
    required this.hint,
     this.icon,
    this.maxLines,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          maxLines: maxLines,
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          style: GoogleFonts.nunito(fontSize: 14, color: Colors.black87),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.nunito(
              color: Colors.grey[400],
              fontSize: 13,
            ),
            prefixIcon: icon != null
                ? Icon(icon, color: const Color(0xFF00ACC1), size: 18)
                : null,
            filled: true,
            fillColor: Colors.grey[50],

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey[200]!, width: 1.5),
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 2, 145, 164),
                width: 0.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 14,
            ),
            errorStyle: GoogleFonts.nunito(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
