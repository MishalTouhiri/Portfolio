import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final double width; // استقبال العرض من الخارج
  final double height; // استقبال الارتفاع من الخارج
  final bool isFixedHeight; // تحديد إذا كانت الارتفاع ثابت أو قابل للتغيير

  const CustomCardWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.height,
    required this.width,
    required this.isFixedHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // عرض الكرت يأتي من الخارج
      height: isFixedHeight ? height : null, // استخدام الثابت إذا كان مخصصًا
      decoration: ShapeDecoration(
        color: Color(0xFF1C1C22),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: isFixedHeight ? (height * 0.5) : 200, // يضبط الصورة بناءً على الحجم
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18, // تقليل الحجم على الشاشات الصغيرة
                    fontFamily: 'Shantell Sans',
                    fontWeight: FontWeight.w700,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14, // تقليل الحجم على الشاشات الصغيرة
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
