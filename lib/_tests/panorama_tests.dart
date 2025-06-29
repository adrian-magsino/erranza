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
  String location_id = "CSPEAR_B1_F1_A6"; 
  String areaView_id = "AV1";

  void initState() {
    super.initState();
    _loadData();
  }
  Future<void> _loadData() async {
    await loadAreaViews();
    
    setScene(areaViewsMap[location_id]?[areaView_id], location_id);
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
    "stairs": "assets/images/hotspots/StairsHotspot.png",
    "room": "assets/images/hotspots/RoomHotspot.png",
    "N/A": "assets/images/hotspots/arrow_hotspot.png"
  };
  
  @override
  Widget build(BuildContext context) {
    if (currentScene == null){
      return const Center(child: CircularProgressIndicator());
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text("$location_id"+"_$areaView_id"),
        backgroundColor: Colors.green,
      ),
      body: PanoramaViewer(
        child: Image.asset(currentScene!.image),
        latitude: 0,
        longitude: 0,
        onViewChanged: (longitude, latitude, tilt) {
          print("Latitude: $latitude");
          print("Longitude: $longitude");
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
                label: areaHotspot.labelText != null ? Container(
                      padding: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.all(Radius.circular(4))),
                      child: Center(child: Text(areaHotspot.labelText!, style: TextStyle(fontSize: 26, color: Colors.white),)),
                    ):Container(),
                iconImage: hotspotIcons[areaHotspot.type]!, onPressed: () {}),
            )
          ),
        ],
      ),
    );
  }
}