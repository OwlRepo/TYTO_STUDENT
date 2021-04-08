import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyto/Constants/TytoColors.dart';
import 'package:tyto/Routes/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splashscreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Get.toNamed(LoginScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: TytoColors.black,
        ),
        child: Center(
          child: Text(
            'SPLASH LOGO',
            style: GoogleFonts.raleway(
              color: TytoColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
