import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  final Animation<double> buttonSqueeze;
  final AnimationController animationController;

  StaggerAnimation({this.animationController})
      : buttonSqueeze = Tween(begin: 320.0, end: 60.0).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Interval(0.0, 0.150),
          ),
        );

  Widget _builderAnimation(BuildContext context, Widget child) {
    return Padding(
      padding: EdgeInsets.only(bottom: 50),
      child: InkWell(
        onTap: () {
          animationController.forward();
        },
        child: Container(
          width: buttonSqueeze.value,
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color.fromRGBO(247, 64, 106, 1.0),
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          child: _buildInside(context),
        ),
      ),
    );
  }

  Widget _buildInside(BuildContext context) {
    if (buttonSqueeze.value > 75) {
      return Text(
        "Sign in",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      );
    } else {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        strokeWidth: 5.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _builderAnimation,
      animation: animationController,
    );
  }
}