import 'package:flutter/material.dart';
import '../app_ui.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label, counterText, helperText, hintText;
  final Widget? icon;
  final String? initialValue;
  final VoidCallback? onEditingComplete, onTap;
  final TextEditingController? controller;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  final bool? obscureText, enabled, readOnly;

  final TextInputType? keyboardType;

  final Widget? suffixIcon;
  final int? minLines;

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
    this.minLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 1,
      maxLines: minLines != null ? minLines! + 1 : 1,
      onTap: onTap,
      keyboardType: keyboardType,
      controller: controller,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        alignLabelWithHint: (minLines != null),
        counterText: counterText,
        helperText: helperText,
        hintText: hintText,
        // icon: icon,
        suffixIcon: suffixIcon,
        prefixIcon: icon != null
            ? Container(
                alignment: Alignment.centerLeft,
                width: 45.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: icon,
                ),
              )
            : null,
        labelText: label,
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
