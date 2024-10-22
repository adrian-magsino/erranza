import 'package:erranza/widgets/hotspot_button.dart';
import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';


class PanoramaViewPage extends StatefulWidget {
  const PanoramaViewPage({super.key});

  @override
  State<PanoramaViewPage> createState() => _PanoramaViewState();
}

class _PanoramaViewState extends State<PanoramaViewPage> {
  
  final List<String> image_list = ['assets/images/360img.jpeg', 'assets/images/360img2.jpeg'];
  int image_index = 0;
  @override
  Widget build(BuildContext context) {
    Widget panorama;
    switch(image_index){
      case 0:
          panorama = PanoramaViewer(
          child: Image.asset(image_list[image_index]),
          hotspots: [
            Hotspot(
              latitude: -15.0,
              longitude: -129.0,
              width: 300,
              height: 300,
              widget: hotspotButton(icon: Icons.open_in_browser, onPressed: () => {
                setState(() => image_index = 1),
              }),
            ),
          ],
          );
      case 1:
          panorama = PanoramaViewer(
          child: Image.asset(image_list[image_index]),
          hotspots: [
            Hotspot(
              latitude: -15.0,
              longitude: -129.0,
              width: 300,
              height: 300,
              widget: hotspotButton(icon: Icons.open_in_browser, onPressed: () => {
                setState(() => image_index = 0),
              }),
            ),
          ],
          );
      default:
          panorama = PanoramaViewer(
          child: Image.asset(image_list[image_index]),
          hotspots: [
            Hotspot(
              latitude: -15.0,
              longitude: -129.0,
              width: 300,
              height: 300,
              widget: hotspotButton(icon: Icons.open_in_browser, onPressed: () => {
                setState(() => image_index = 1),
              }),
            ),
          ],
          );
    }
    

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

