import 'package:erranza/data/load_areaViews.dart';
import 'package:erranza/widgets/hotspot_button.dart';
import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

import '../data/areas.dart';

//THIS FILE IS FOR TESTING AND EDITING FEATURES RELATED TO PANORAMA VIEWS
//GO TO main.dart -> class "MyApp" -> build function
//REPLACE THE WIDGET IN "home" property to PanoramaTests()

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
    String location_id = "CSPEAR_B1_F1_A11"; 
    setScene(areaViewsMap[location_id]?["AV1"], location_id);
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
            width: areaHotspot.width,
            height: areaHotspot.height,
            widget: FittedBox(
              fit: BoxFit.contain,
              child: hotspotButton(
                label: Container(
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: Center(child: Text("LABEL", style: TextStyle(fontSize: 26, color: Colors.white),)),
                  ),
                iconImage: hotspotIcons[areaHotspot.type]!, onPressed: () {}),
            )
          ),
        ],
      ),
    );
  }
}