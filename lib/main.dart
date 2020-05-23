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
  Animation<double> otherAnimation;

  @override
  void initState() {
    super.initState();

    // The "vsync" is a Mixin => SingleTickerProviderStateMixin
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // Linear mapping of animation from 0 to 1, to 0 to 300
    animation = CurvedAnimation(
        parent: _animationController, curve: Curves.elasticOut)
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
    return SizeAndOpacityTransition(
      child: LogoWidget(),
      animation: animation,
    );
  }
}

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterLogo(),
    );
  }
}

class SizeAndOpacityTransition extends StatelessWidget {
  final Widget child;
  final Animation animation;

  final sizeTween = Tween<double>(begin: 0, end: 300);
  final opacityTween = Tween<double>(begin: 0.1, end: 1);

  SizeAndOpacityTransition({this.child, this.animation});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Opacity(
            opacity: opacityTween.evaluate(animation).clamp(0, 1.0),
            child: Container(
              height: sizeTween.evaluate(animation),
              width: sizeTween.evaluate(animation),
              child: child,
            ),
          );
        },
        child: child,
      ),
    );
  }
}
