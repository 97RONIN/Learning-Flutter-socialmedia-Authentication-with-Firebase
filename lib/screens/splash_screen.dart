import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newtesst/provider/sign_in_provider.dart';
import 'package:newtesst/screens/login_screen.dart';
import 'package:newtesst/screens/home_screen.dart';
import 'package:newtesst/utils/config.dart';
import 'package:provider/provider.dart';

import '../utils/next_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //init state
  @override
  void initState() {
    final sp = context.read<SignInProvider>();
    super.initState();
    //timer 2 sec
    Timer(const Duration(seconds: 2), () {
      sp.isSignedIn == false
          ? nextScreen(context, const LoginScreen())
          : nextScreen(context, const HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Image(
          image: AssetImage(Config.app_icon),
          height: 80,
          width: 80,
        ),
      )),
    );
  }
}
