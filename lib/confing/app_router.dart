import 'package:flutter/cupertino.dart';
import '../file_export.dart';


class AppRouter{
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_)=> SplashScreen());
      case '/homeScreen':
        return CupertinoPageRoute(builder: (_)=> const HomeScreen());
      case '/scoreScreen':
        return CupertinoPageRoute(builder: (_)=> ScoreScreen());

      default:
        return null;
    }
  }
}