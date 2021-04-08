import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyto/Constants/TytoColors.dart';
import 'package:tyto/Routes/LoadingScreen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _isPasswordHidden = true;
  final _studentIDController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: TytoColors.black,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Center(
                  child: Text(
                    'LOGO HERE',
                    style: GoogleFonts.raleway(
                      color: TytoColors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'LOG IN',
                        style: GoogleFonts.raleway(
                          color: TytoColors.darkMintGreen,
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Welcome!',
                        style: GoogleFonts.raleway(
                          color: TytoColors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Please log in to continue...',
                        style: GoogleFonts.raleway(
                          color: TytoColors.white,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 20.0,
                      ),
                      child: TextFormField(
                        controller: _studentIDController,
                        cursorColor: TytoColors.darkMintGreen,
                        keyboardType: TextInputType.number,
                        textAlignVertical: TextAlignVertical.center,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Student ID',
                          hintStyle: GoogleFonts.raleway(),
                          prefixIcon: Icon(
                            Icons.account_circle,
                            color: TytoColors.black,
                          ),
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: TytoColors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextFormField(
                        controller: _passwordController,
                        cursorColor: TytoColors.darkMintGreen,
                        textAlignVertical: TextAlignVertical.center,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: GoogleFonts.raleway(),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: TytoColors.black,
                          ),
                          suffixIcon: Container(
                            width: 10.0,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isPasswordHidden = !_isPasswordHidden;
                                });
                              },
                              child: FaIcon(
                                _isPasswordHidden
                                    ? FontAwesomeIcons.eyeSlash
                                    : FontAwesomeIcons.eye,
                                size: 20.0,
                                color: _isPasswordHidden
                                    ? Colors.grey
                                    : TytoColors.darkMintGreen,
                              ),
                            ),
                          ),
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: TytoColors.white,
                        ),
                        obscureText: _isPasswordHidden,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 10.0,
                      ),
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.raleway(
                          color: TytoColors.white,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.transparent,
                    ),
                    SizedBox(
                      height: 50.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: TytoColors.darkMintGreen,
                            elevation: 5.0,
                          ),
                          onPressed: () {
                            Get.toNamed(LoadingScreen.routeName);
                          },
                          child: Text(
                            'SUBMIT',
                            style: GoogleFonts.raleway(
                              color: TytoColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
