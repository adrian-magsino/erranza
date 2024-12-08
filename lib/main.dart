import 'package:erranza/data/appSettings.dart';
import 'package:erranza/_tests/duplicateID_checker.dart';
import 'package:erranza/data/loadAreas.dart';
import 'package:erranza/widgets/navigation_bar.dart';
import 'package:erranza/_tests/panorama_tests.dart';
import 'package:erranza/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



void main() {
  runApp(const MyApp());
  getSettings();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const AppInitializer(), //switch to PanoramaTests() for testing images and hotspots
      //switch back to AppInitializer() to run main app
    );
  }
}

class AppInitializer extends StatelessWidget {
  const AppInitializer({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: load_areas_data(), 
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),)
            );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error loading data: ${snapshot.error}"),
            ),
          );
        }
        return const SplashScreen();
      }
    );
  }
}





