import 'package:bmi/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.width, required this.height, required this.txt, required this.onPressed});

  final double width;
  final double height;
  final String txt;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height * 0.07),
        backgroundColor: AppColors.secondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        txt,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
