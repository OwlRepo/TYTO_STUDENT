import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyto/Constants/TytoColors.dart';
import 'package:tyto/Provider/LoadingText.dart';
import 'package:tyto/Routes/LiveQuizLoadingScreen.dart';

class LoadingScreen extends StatefulWidget {
  static const routeName = '/loading';
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    LoadingText.textEvent.value = 'Loading';
    Future.delayed(
      Duration(seconds: 3),
      () {
        LoadingText.textEvent.value = 'Entering the room';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: TytoColors.black,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(LiveQuizLoadingScreen.routeName);
              },
              child: SpinKitFadingCube(
                color: TytoColors.darkMintGreen,
                size: 100.0,
              ),
            ),
            SizedBox(height: 70.0),
            Obx(
              () => Text(
                '${LoadingText.textEvent.value}',
                style: GoogleFonts.raleway(
                  color: TytoColors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
