import 'package:flutter/material.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quick Tutorial"),
        backgroundColor: Colors.green[800],
      ),
      body: Center(
        child: Text("Quick Tutorial"),
      ),
    );
  }
}