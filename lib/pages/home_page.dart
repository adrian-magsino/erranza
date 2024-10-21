import 'package:erranza/pages/panorama_view_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Colors.green,
        ),
      body: Center(
        child: ElevatedButton(
            child: Text("Go to Panorama View"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PanoramaViewPage(),),);
            },
          ),
        ),
    );
  }
}