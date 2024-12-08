import 'dart:async';

import 'package:erranza/main.dart';
import 'package:erranza/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> 
  with TickerProviderStateMixin{

  late AnimationController controller;
  late Timer _loadingTimer;
  int _loadingTextIndex = 0;

  final List<String> _loadingTexts = [
    "Loading app data...",
    "Loading assets...",
    "Initializing..."
  ];

  @override  
  void initState() {
    super.initState();
    //controller for loading progress bas
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
      )..addListener(() {
        setState(() {});
    });

    controller.forward();

    //timer for loading texts
    _loadingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_loadingTextIndex < _loadingTexts.length - 1) {
        setState(() {
          _loadingTextIndex++;
        });
      }
    });

    //duration of loading progress bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const CustomNavBar()));
    });
  }
  @override
  void dispose() {
    controller.dispose();
    _loadingTimer.cancel();
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splashScreenBG.png'),
            fit: BoxFit.cover,
            )
          ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/erranzaLogo.png', width: 100, height: 100,),
              SizedBox(height: 20),
              Text("Erranza", style: TextStyle(
                color: Colors.black, 
                fontSize: 32, 
                fontWeight: FontWeight.w400, 
                fontFamily: "Righteous",
                letterSpacing: 10,
                ),),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: LinearProgressIndicator(
                  value: controller.value,        
                  color: Colors.green[900],         
                ),  
              ),
              Text(
                _loadingTexts[_loadingTextIndex],
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black
                ),
              )
            ]
          )
        ),
      )
    );
  }
}