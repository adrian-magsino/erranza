import 'package:erranza/widgets/hotspot_button.dart';
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
    Widget panorama = PanoramaViewer(
          child: Image.asset('assets/images/360img.jpeg'),
          hotspots: [
            Hotspot(
              latitude: -15.0,
              longitude: -129.0,
              width: 300,
              height: 300,
              widget: hotspotButton(icon: Icons.open_in_browser, onPressed: () => ()),
            ),
          ],
          );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Panorama View Page"),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          panorama,
        ],
      )
    ); 
  }
}

