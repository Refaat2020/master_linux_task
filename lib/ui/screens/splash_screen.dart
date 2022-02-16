import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>with TickerProviderStateMixin  {
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(vsync: this);
    _controller.addListener(() {
      if (_controller.isCompleted) {
        Navigator.pushNamedAndRemoveUntil(
            context, "/homeScreen", (route) => false);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: ScreenUtil().screenHeight,
        child: Lottie.asset(
          "assets/writingAnExam.json",
          controller: _controller,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
