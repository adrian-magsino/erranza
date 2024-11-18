import 'package:erranza/data/appSettings.dart';
import 'package:erranza/data/load_areaViews.dart';
import 'package:erranza/data/areas.dart';
import 'package:erranza/widgets/hotspot_button.dart';
import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class PanoramaViewPage extends StatefulWidget {
  const PanoramaViewPage({
    super.key,
    required this.initialArea,

    });
    final Area initialArea;

  @override
  State<PanoramaViewPage> createState() => _PanoramaViewState();
}

class _PanoramaViewState extends State<PanoramaViewPage> {
 
  AreaView? currentScene;
  Area? currentArea;

  late String initialLocationId;
  late Area initialArea;

  Map<String, String> hotspotIcons = {
    "move": "assets/images/hotspots/MoveHotspot.png",
    "stairs": "assets/images/hotspots/arrow_hotspot.png"
  };

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  //Load the data from load_areaView.dart
  Future<void> _loadData() async {
    await loadAreaViews();

    //set initial scene
    initialArea = widget.initialArea;
    initialLocationId = "${initialArea.college_id}_${initialArea.building_id}_${initialArea.floor_id}_${initialArea.area_id}";

    setCurrentScene(areaViewsMap[initialLocationId]?["AV1"]!, initialLocationId);

  }
  
  //Determine which Area is the Current Scene
  Area? getCurrentArea(List area_List, String? currentLocationId){
    for (Area area in area_List) {
      String newLocationId = "${area.college_id}_${area.building_id}_${area.floor_id}_${area.area_id}";
      if (newLocationId == currentLocationId) {
        return area;
      }
    }
    return null;
  }

  //Set the Current Scene or Area View
  void setCurrentScene(AreaView? scene, String locationId){
    if (scene != null){
      setState(() {
        currentScene = scene;   
        currentArea = getCurrentArea(allAreas, locationId);  
    });
    }
    
  }
  
  void switchNextScene(String nextScene) async {
    var getNewIDs = nextScene.split(":");
    String newLocationId = getNewIDs[0];
    String newSceneId = getNewIDs[1];

    AreaView? nextAreaView = areaViewsMap[newLocationId]?[newSceneId];

    if (nextAreaView != null) {
      await precacheImage(AssetImage(nextAreaView.image), context);     
       
      setCurrentScene(nextAreaView, newLocationId);
    }
  }
 
  @override
  Widget build(BuildContext context) {
    if (currentScene == null) {
    return const Center(child: CircularProgressIndicator());
  }
    
    return Scaffold(
      appBar: AppBar(
        title: Text(currentArea!.area_name),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
            PanoramaViewer(
            sensitivity: panoramaSensitivityValue,
            sensorControl: gyroSwitch ? SensorControl.orientation: SensorControl.none,
            child: Image.asset(currentScene!.image), 
            hotspots: [
              for (var areaHotspot in currentScene!.areaHotspots)
              Hotspot(
                latitude: areaHotspot.latitude,
                longitude: areaHotspot.longitude,
                width: 300,
                height: 300,
                widget: hotspotButton(icon: hotspotIcons[areaHotspot.type]!, onPressed: () {
                  switchNextScene(areaHotspot.nextView);
                }),
              ),
            ],
          ),
      ],
      )
    ); 
  }
}
