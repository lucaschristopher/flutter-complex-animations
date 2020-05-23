import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(
        top: 160,
      ),
      onPressed: () {},
      child: Text(
        "Não possui uma conta? Cadastre-se",
        textAlign: TextAlign.center,
        style: TextStyle(
          letterSpacing: 0.5,
          fontWeight: FontWeight.w300,
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }
}