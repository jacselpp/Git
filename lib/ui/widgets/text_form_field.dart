import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../app_ui.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label, counterText, helperText, hintText;
  final IconData? icon;
  final String? initialValue;
  final VoidCallback? onEditingComplete, onTap;
  final TextEditingController? controller;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  final bool? obscureText, enabled, readOnly;

  final TextInputType? keyboardType;

  final Widget? suffixIcon;

  const CustomTextFormField({
    Key? key,
    this.controller,
    this.counterText,
    this.enabled,
    this.helperText,
    this.hintText,
    this.icon,
    this.initialValue,
    this.keyboardType,
    this.label,
    this.obscureText,
    this.onChanged,
    this.onEditingComplete,
    this.validator,
    this.suffixIcon,
    this.readOnly,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      keyboardType: keyboardType,
      controller: controller,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        counterText: counterText,
        helperText: helperText,
        hintText: hintText,
        icon: icon != null ? Icon(icon) : null,
        suffixIcon: suffixIcon,
        labelText: label,
        labelStyle: const TextStyle(
          fontSize: 14.0,
          color: primaryColor,
        ),
        contentPadding: const EdgeInsets.all(10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      enabled: enabled,
      initialValue: initialValue,
      obscureText: obscureText ?? false,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      readOnly: readOnly ?? false,
      style: const TextStyle(
        color: primaryColor,
      ),
      validator: validator,
    );
  }
}
