import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_to_paradise/home/home.dart';
import 'package:path_to_paradise/home/my_theme.dart';
import 'package:path_to_paradise/providers/my_provider.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = "SplashPAge";

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
void initState() {
    Timer(
        const Duration(seconds: 1), navigatorToHomeScreen);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      backgroundColor: provider.selectedMode == ThemeMode.light ?
      const Color(0xFFFFFFFF) : MyThemeData.secondaryColor,
      body:
      SizedBox(
        width: double.infinity,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 5,
              child: Container(
                  alignment: AlignmentDirectional.center,
                  child: Image.asset(provider.getSplashImage()))),
          Expanded(
            flex: 1,
            child: Container(
                alignment: AlignmentDirectional.bottomCenter,
                child: Image.asset(provider.getSplashBrand())),
          ),
        ]),
      ),
    );
  }
  void navigatorToHomeScreen(){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
    builder: (context) => const HomeScreen(),), (route) => false);
}
}
