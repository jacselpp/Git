import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final Color color;
  final String label;
  final VoidCallback onPressed;

  const CustomTextButton(
      {Key? key,
      required this.color,
      required this.label,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          label.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
