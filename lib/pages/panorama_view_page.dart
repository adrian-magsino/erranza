import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';


class PanoramaViewPage extends StatefulWidget {
  const PanoramaViewPage({super.key});

  @override
  State<PanoramaViewPage> createState() => _PanoramaViewState();
}

class _PanoramaViewState extends State<PanoramaViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Panorama View Page"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: PanoramaViewer(
          child: Image.asset('assets/images/360img.jpeg'),),),
    ); 
  }
}

