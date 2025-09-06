import 'package:flutter/material.dart';
import 'package:islami_app_online_sat/core/resources/assets_manager.dart';
import 'package:islami_app_online_sat/core/resources/colors_manager.dart';
import 'package:islami_app_online_sat/core/routes_manager/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigate();
  }

  void navigate(){
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
    });

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            children: [
              Spacer(flex: 4),
              Image.asset(ImageAssets.splashLogo),
              Spacer(flex: 6),
              Image.asset(ImageAssets.brandingImage),
            ],
          ),
        ),
      ),
    );
  }
}
