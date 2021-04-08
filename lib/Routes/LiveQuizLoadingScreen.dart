import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_progress_indicator_ns/liquid_progress_indicator.dart';
import 'package:tyto/Constants/TytoColors.dart';

class LiveQuizLoadingScreen extends StatefulWidget {
  static const routeName = '/livequizloading';
  @override
  _LiveQuizLoadingScreenState createState() => _LiveQuizLoadingScreenState();
}

class _LiveQuizLoadingScreenState extends State<LiveQuizLoadingScreen> {
  Timer _quizCountdown;
  int _timeLeft = 60;
  double _loadingTimeLeft = 0.0;
  @override
  void initState() {
    super.initState();
    const oneSec = const Duration(seconds: 1);
    _quizCountdown = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_timeLeft == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _timeLeft--;
            _loadingTimeLeft += 0.018;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _quizCountdown.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            LiquidLinearProgressIndicator(
              value: _loadingTimeLeft, // Defaults to 0.5.
              valueColor: AlwaysStoppedAnimation(TytoColors
                  .darkMintGreen), // Defaults to the current Theme's accentColor.
              backgroundColor: TytoColors
                  .black, // Defaults to the current Theme's backgroundColor.
              borderColor: Colors.transparent,
              borderWidth: 5.0,
              borderRadius: 12.0,
              direction: Axis
                  .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
              center: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'LIVE QUIZ\n\n',
                      style: GoogleFonts.raleway(
                        color: TytoColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 55.0,
                      ),
                    ),
                    TextSpan(
                      text: 'The live quiz will start after the timer.\n\n\n',
                      style: GoogleFonts.raleway(
                        color: TytoColors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    TextSpan(
                      text: '$_timeLeft\n',
                      style: GoogleFonts.raleway(
                        color: TytoColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 85.0,
                      ),
                    ),
                    TextSpan(
                      text: 'SECONDS',
                      style: GoogleFonts.raleway(
                        color: TytoColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
