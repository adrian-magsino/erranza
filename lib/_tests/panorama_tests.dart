import 'package:erranza/data/load_areaViews.dart';
import 'package:erranza/widgets/hotspot_button.dart';
import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

import '../data/areas.dart';

class PanoramaTests extends StatefulWidget {
  const PanoramaTests({super.key});

  @override
  State<PanoramaTests> createState() => _PanoramaTestsState();
}

class _PanoramaTestsState extends State<PanoramaTests> {

  Area? currentArea;
  AreaView? currentScene;

  void initState() {
    super.initState();
    _loadData();
  }
  Future<void> _loadData() async {
    await loadAreaViews();
    String location_id = "CSPEAR_B1_F1_A3"; 
    setScene(areaViewsMap[location_id]?["AV2"], location_id);
  }

  void setScene(AreaView? scene, String location_id){
    if (scene != null){
      setState(() {
      print("LOCATION ID: $location_id"); 
      currentScene = scene;
    });
    } else {
      print("SCENE IS NULL");
    }    
  }
  
  Map<String, String> hotspotIcons = {
    "move": "assets/images/hotspots/MoveHotspot.png",
    "stairs": "assets/images/hotspots/arrow_hotspot.png"
  };
  
  @override
  Widget build(BuildContext context) {
    if (currentScene == null){
      return const Center(child: CircularProgressIndicator());
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Area"),
        backgroundColor: Colors.green,
      ),
      body: PanoramaViewer(
        child: Image.asset(currentScene!.image),
        latitude: 0,
        longitude: 0,
        onViewChanged: (longitude, latitude, tilt) {
          print("Longitude: $longitude");
          print("Latitude: $latitude");
        },
        hotspots: [
          for (var areaHotspot in currentScene!.areaHotspots)
          Hotspot(
            latitude: areaHotspot.latitude,
            longitude: areaHotspot.longitude,
            width: 300,
            height: 300,
            widget: hotspotButton(icon: hotspotIcons[areaHotspot.type]!, onPressed: () {})
          )
        ],
      ),
    );
  }
}