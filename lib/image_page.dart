import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class image_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      backgroundColor: Colors.blueAccent.shade200,
      elevation: 10,
      title: Text('Image View'),
    ),
    body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xff5ee7df),
                  Color(0xffb490ca),

                ]
            )
        ),
        child: Image.asset('assets/images/BMI.png')),

  );
  }
}
