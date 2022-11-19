import 'dart:ui';
import 'package:chat_new/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  late FirebaseAuth auth;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          width: size.width.w * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white.withOpacity(0.1),
                            border: Border.all(
                              color: Colors.white24,
                              width: 2.w,
                            ),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: _buildForm(context),
                        ),
                      ),
                    ),
                  ],
                ),
                /*Column(
                    children: [
                      SizedBox(height: 16.h),
                      _buildForgotPassword(context),
                      SizedBox(height: 16.h),
                      buildNoAccount(context),
                    ],
                  )*/
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Form _buildForm(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("Reset Password",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: 'Calisto',
                )),
            SizedBox(height: 16.h),
            Text("Password reset instructions will be sent to your email.",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Calisto',
                    fontWeight: FontWeight.w100)),
            SizedBox(height: 16.h),
            _buildEmailField(),
            SizedBox(height: 16.h),
            _builResetPassword(context),
            SizedBox(height: 16.h),
            _buildLoginPage(context),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.white.withOpacity(0.6),
        ),
        child: TextFormField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value!.isEmpty) {
              callSnackbar('E-mail boş olamaz.');
              return '';
            }
            return null;
          },
          decoration: const InputDecoration(
            labelText: "E-mail",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  GestureDetector _buildLoginPage(BuildContext context) {
    return GestureDetector(
        child: const Text(
          "Login",
          style: TextStyle(
              decoration: TextDecoration.underline, color: Colors.black54),
        ),
        // şifre unuttum kismi burda birazdan yap
        onTap: () {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
            builder: (context) {
              return LoginPage();
            },
          ), ((route) => false));
        });
  }

  void callSnackbar(String error, [Color? color, VoidCallback? onVisible]) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      //padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      backgroundColor: color ?? Colors.red,
      //duration: Duration(milliseconds: 500),
      onVisible: onVisible,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: SizedBox(
        width: 40.w,
        height: 40.h,
        child: Center(
          child: Text(error, style: const TextStyle(color: Colors.white)),
        ),
      ),
    ));
  }

  ElevatedButton _builResetPassword(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          onPrimary: Colors.black,
          primary: Colors.black,
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          minimumSize: const Size(double.infinity, 50)),
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          await resetPassword();
        }
      },
      child: Text("Reset Password",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          )),
    );
  }

  Future resetPassword() async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.sendPasswordResetEmail(email: emailController.text);

      callSnackbar(
          "Password reset instructions have been sent to email!", Colors.green,
          () {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
          builder: (context) {
            Duration(milliseconds: 500);
            return LoginPage();
          },
        ), ((route) => false));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        callSnackbar("Invalid e-mail!");
        return '';
      }
    }
  }
}
