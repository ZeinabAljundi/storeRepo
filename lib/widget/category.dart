import 'package:flutter/material.dart';
import '../../../core/constances/all_colors.dart';
class CategoryItem extends StatelessWidget {
  final String label;

  const CategoryItem({required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle tap here if needed
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: MyColor.myWhite,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16.0,
              color: MyColor.myBlack,
            ),
          ),
        ),
      ),
    );
  }
}