import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.imagePath,
  });

  final bool isSelected;
  final VoidCallback onTap;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isSelected ? Colors.green : Colors.transparent,
              width: 2,
            ),
          ),
          child: Image.asset(imagePath, fit: BoxFit.fill),
        ),
      ),
    );
  }
}
