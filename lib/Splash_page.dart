import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stack/main.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';


class Splash_page extends StatefulWidget {
  @override
  State<Splash_page> createState() => _Splash_pageState();
}

class _Splash_pageState extends State<Splash_page> with SingleTickerProviderStateMixin {
  late Animation animation;
  late Animation size_animation;
  late AnimationController animationController;
  var _radius= [100.0,150.0,200.0,250.0];
  @override
  void initState() {
    super.initState();

    animationController=AnimationController(vsync: this, duration: Duration(seconds: 4,),lowerBound: 0.5);
    size_animation= Tween(begin: 100.0,end: 200.0).animate(animationController);
    animation= ColorTween(begin: Color(0xffb490ca) ,end: Color(0xff5ee7df)).animate(animationController);
    animationController.addListener(() {
      setState(() {

      });
      
    });
    animationController.forward();
    Timer(Duration(seconds: 5),() {
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
      });
 }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: NewGradientAppBar(
          gradient: LinearGradient(
            colors: [
              Color(0xff5ee7df),
              Color(0xffb490ca),
            ]
          )
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: animation.value,
        child: Stack(
          alignment: Alignment.center,
          children: [
            buildMyContainer(_radius[0]),
            buildMyContainer(_radius[1]),
            buildMyContainer(_radius[2]),
            buildMyContainer(_radius[3]),
            Container(
              width: size_animation.value,
              height: size_animation.value,
              child: Lottie.asset('assets/animations/splash_animation.json'),
            ),
          ],
        ),
      )
    );
  }
Widget buildMyContainer (radius){
    return Container(
      width: radius*animationController.value,
      height: radius*animationController.value,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blueAccent.shade200
      ),
    );
}


}
