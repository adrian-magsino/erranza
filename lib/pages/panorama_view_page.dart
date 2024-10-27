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

  late String location_id;
  late String scene_location_id;

  String? currentArea_Id;
  late Area? currentArea;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  //Get Parent Key or Location ID of Current Scene
  String? getParentKey(Map<String, Map<String, AreaView>> map, dynamic scene) {
      for (var entry in map.entries){
        if (entry.value.containsValue(scene)) {
          return entry.key;
        }
      }
      return null;
    }

  //Determine which Area is the Current Scene
  Area? getCurrentArea(List area_List, String? currentArea_Id){
      for (Area area in area_List) {
        String newLocationId = "${area.college_id}_${area.building_id}_${area.floor_id}_${area.area_id}";
        if (newLocationId == currentArea_Id) {
          return area;
        }
      }
      return null;
  }

  //Set the Current Scene or Area View
  void setCurrentScene(dynamic scene){
    setState(() {
      currentScene = scene;
      currentArea_Id = getParentKey(areaViewsMap, currentScene);
      currentArea = getCurrentArea(allAreas, currentArea_Id);
    });
  }

  //Load the data from load_areaView.dart
  Future<void> _loadData() async {
    await loadAreaViews();

    //set initial scene
    Area initialArea = widget.initialArea;
    location_id = "${initialArea.college_id}_${initialArea.building_id}_${initialArea.floor_id}_${initialArea.area_id}";

    setCurrentScene(areaViewsMap[location_id]?["AV1"]!);

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
            child: Image.asset(currentScene!.image), 
            hotspots: [
              for (var areaHotspot in currentScene!.areaHotspots)
              Hotspot(
                latitude: areaHotspot.latitude,
                longitude: areaHotspot.longitude,
                width: 300,
                height: 300,
                widget: hotspotButton(icon: Icons.arrow_circle_up, onPressed: () {
                  setCurrentScene(areaHotspot.nextView);
                }),
              ),
            ],
          ),
      ],
      )
    ); 
  }
}
