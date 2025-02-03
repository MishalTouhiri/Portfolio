import 'package:flutter/material.dart';
import 'package:mishal/Custom%20Widget/CardWidget.dart';

class ProjectsSectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: Center(
        child: Text(
          'Projects Section',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
