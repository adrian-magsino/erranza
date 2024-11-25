import 'package:flutter/material.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        backgroundColor: Colors.green[800],
      ),
      body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Align(
                alignment: Alignment.center,
                child: Image.asset('assets/images/erranzaLogo.png', width: 100, height: 100,)
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            ListTile(
              title: const Text("Version", style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),),
              subtitle: const Text("Debug 123.456.78"),
            ),
          ],
        ),
    );
  }
}