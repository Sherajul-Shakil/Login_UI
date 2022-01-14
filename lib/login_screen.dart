// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:login_ui/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Container(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              emailField(),
              passwordField(),
              Container(
                margin: const EdgeInsets.only(top: 25.0),
              ),
              submitButton(),
            ],
          ),
        ),
      ),
    );
  }

  emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email Address',
        hintText: 'user@mail.com',
      ),
      validator: validateEmail,
      onSaved: (value) {
        email = value!;
      },
    );
    // ignore: dead_code, unused_label
  }

  passwordField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Enter Password',
        hintText: 'password',
      ),
      obscureText: true,
      validator: validatePassword,
      onSaved: (value) {
        password = value!;
      },
    );
    // ignore: dead_code, unused_label
  }

  submitButton() {
    return RaisedButton(
      child: const Text('submit'),
      padding: const EdgeInsets.all(5.0),
      color: Colors.blue,
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          print('$email and $password are saved');
          //Text('$email and $password are saved');
        }
      },
    );
  }
}
