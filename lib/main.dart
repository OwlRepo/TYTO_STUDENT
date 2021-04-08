import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tyto/Routes/LiveQuizLoadingScreen.dart';
import 'package:tyto/Routes/LoadingScreen.dart';
import 'package:tyto/Routes/LoginScreen.dart';
import 'package:tyto/Routes/SplashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tyto',
      initialRoute: SplashScreen.routeName,
      getPages: [
        GetPage(
          name: SplashScreen.routeName,
          page: () => SplashScreen(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: LoginScreen.routeName,
          page: () => LoginScreen(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: LoadingScreen.routeName,
          page: () => LoadingScreen(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: LiveQuizLoadingScreen.routeName,
          page: () => LiveQuizLoadingScreen(),
          transition: Transition.fadeIn,
        ),
      ],
    );
  }
}
