import 'package:erranza/data/duplicateID_checker.dart';
import 'package:erranza/pages/navigation_bar.dart';
import 'package:flutter/material.dart';



void main() {
  //checks if there are duplicate IDs in areas.dart
  if (!hasDuplicateID()) {
    String text = "F2";
    print("SAMPLE TEXT: ${text.substring(1, 2)}");
    runApp(const MyApp());
  }
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




