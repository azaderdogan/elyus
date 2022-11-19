import 'package:chat_new/screens/landing.dart';
import 'package:chat_new/screens/register.dart';
import 'package:chat_new/screens/home.dart';
import 'package:chat_new/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      name: 'chat',
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      //deneme1
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          initialRoute: '/landing',
          routes: {
            // When navigating to the "/" route, build the FirstScreen widget.
            '/': (context) => const HomeScreen(),
            // When navigating to the "/second" route, build the SecondScreen widget.
            '/register': (context) => const RegisterPage(),
            '/login': ((context) => const LoginPage()),
            '/landing': (context) => const LandingPage(),
            //dsadas
          },
        );
      },
    );
  }
}
