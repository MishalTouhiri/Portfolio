import 'package:flutter/material.dart';

class InfoCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final double width;
  final double height;
  final bool isFixedHeight;
  final Color backgroundColor;
  final Color textColor;
  final IconData? icon;

  const InfoCardWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.width,
    required this.height,
    required this.isFixedHeight,
    this.backgroundColor = const Color(0xFF1C1C22),
    this.textColor = Colors.white,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double imageHeight = MediaQuery.of(context).size.width > 900
        ? height * 0.2
        : 60;

    return Container(
      width: width,
      height: isFixedHeight ? height : null,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.blue.withOpacity(0.1),
          width: 2,
        ),
      ),
      child: Column(
        mainAxisSize: isFixedHeight ? MainAxisSize.max : MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- صورة أو أيقونة ---
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                )
              ],
            ),
            child: icon != null
                ? Icon(icon, size: imageHeight, color: Colors.black)
                : Image.network(
                    imageUrl,
                    width: imageHeight,
                    height: imageHeight,
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(height: 20),

          // --- العنوان ---
          Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: 20,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          // --- الوصف ---
          Text(
            description,
            style: TextStyle(
              color: textColor.withOpacity(0.8),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
