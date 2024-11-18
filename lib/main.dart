import 'package:erranza/data/duplicateID_checker.dart';
import 'package:erranza/data/loadAreas.dart';
import 'package:erranza/pages/navigation_bar.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
  load_areas_data();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const CustomNavBar(),
    );
  }
 
}




