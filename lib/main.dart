import 'package:flutter/material.dart';
import 'package:some_app/pages/home_page.dart';
import 'package:some_app/pages/login_page.dart';
import 'package:some_app/utils/routes.dart';
import 'package:some_app/widgets/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyThemes.lightTheme(context),
      darkTheme: MyThemes.darkTheme(context),
      initialRoute: Routes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        Routes.homeRoute: (context) => HomePage(),
        Routes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}
