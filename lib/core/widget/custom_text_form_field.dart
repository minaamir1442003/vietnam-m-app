import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/text_styles.dart';

class AppTextFormField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String ?initialValue;
  final void Function(String)? onChanged;
  final Color? borderColor;
  final Color? focusBorderColor;
  final bool isEnabled ;

  const AppTextFormField({
    super.key,
    required this.hint,
    this.controller,
    this.validator,
    this.isEnabled= true,
    this.keyboardType = TextInputType.text,
    this.initialValue,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.borderColor,
    this.focusBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    final defaultBorder = borderColor ?? AppColors.whiteColor;
    final defaultFocusBorder = focusBorderColor ?? AppColors.primaryColor;

    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType,
      initialValue: initialValue,
      enabled: isEnabled,
      obscureText: obscureText,
      style: AppTextStyles.inter400_14.copyWith(color: AppColors.blackColor),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hint,
        errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: defaultBorder),
          borderRadius: BorderRadius.circular(24),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: defaultBorder),
          borderRadius: BorderRadius.circular(24),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: defaultFocusBorder, width: 2),
          borderRadius: BorderRadius.circular(24),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}
