import 'package:flutter/material.dart';

class UpdatesPage extends StatelessWidget {
  const UpdatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Updates"),
        backgroundColor: Colors.green[800],
      ),
      body: Center(
        child: Text("No Available Updates"),
      ),
    );
  }
}