import 'package:complex_animations/screens/login/widgets/input_form_field.dart';
import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        child: Column(
          children: <Widget>[
            InputFormField(
              hint: "Username",
              obscure: false,
              icon: Icons.person_outline,
            ),
            InputFormField(
              hint: "Password",
              obscure: true,
              icon: Icons.lock_outline,
            ),
          ],
        ),
      ),
    );
  }
}
