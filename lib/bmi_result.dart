import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
  const BmiResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()
          {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Center(
        child: Text(
          'BMI RESULT',
          style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
