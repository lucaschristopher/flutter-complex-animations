import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Complex Animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LogoApp(),
    );
  }
}

class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

// The "SingleTickerProviderStateMixin" informs us every time the screen is rendered
class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  // A controller for your animations
  AnimationController _animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    // The "vsync" is a Mixin => SingleTickerProviderStateMixin
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // Linear mapping of animation from 0 to 1, to 0 to 300
    animation = Tween<double>(begin: 0, end: 300).animate(_animationController)
      // The ".." operator is the same as repeating: animation = [...]; animation.addStatus[...]
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedLogo(animation);
  }
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo(Animation<double> animation) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;

    return Center(
      child: Container(
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}
