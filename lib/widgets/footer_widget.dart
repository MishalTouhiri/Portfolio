import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Image.asset('assets/bitmoji.png', width: 200),
          Text(
            'I design intuitive user interfaces and create engaging experiences for users!',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
