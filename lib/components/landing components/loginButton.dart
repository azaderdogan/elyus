import 'package:chat_new/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  LoginButton({Key? key}) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          onPrimary: Color.fromARGB(255, 182, 99, 174),
          primary: Colors.white,
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          minimumSize: const Size(200, 50)),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return LoginPage();
            },
          ),
        );
      },
      child: Text("Login",
          style: TextStyle(
            fontFamily: 'Calisto',
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          )),
    );
  }
}
