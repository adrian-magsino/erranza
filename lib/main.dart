import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("Home Page"),
        ),
        body: Stack(
          children: [
            PanoramaViewer(child: Image.asset("assets/images/360img.jpeg"),)            
          ],
        ),
      ),
    );
  }
 
}


