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

  String? getParentKey(Map<String, Map<String, AreaView>> map, dynamic scene) {
      for (var entry in map.entries){
        if (entry.value.containsValue(scene)) {
          return entry.key;
        }
      }
      return null;
    }

    Area? getCurrentArea(List area_List, String? currentArea_Id){
      for (Area area in area_List) {
        String newLocationId = "${area.college_id}_${area.building_id}_${area.floor_id}_${area.area_id}";
        if (newLocationId == currentArea_Id) {
          return area;
        }
      }
      return null;
  }

  Future<void> _loadData() async {
    await loadAreaViews();
    Area initialArea = widget.initialArea;
    location_id = "${initialArea.college_id}_${initialArea.building_id}_${initialArea.floor_id}_${initialArea.area_id}";

    currentScene = areaViewsMap[location_id]?["AV1"]!;
    
    
    //scene_location_id = currentScene;
    currentArea_Id = getParentKey(areaViewsMap, currentScene);
    currentArea = getCurrentArea(areas, currentArea_Id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (currentScene == null) {
    return const Center(child: CircularProgressIndicator());
  }

    Widget panorama;
    panorama = PanoramaViewer(
          child: Image.asset(currentScene!.image), 
          hotspots: [
            for (var areaHotspot in currentScene!.areaHotspots)
            Hotspot(
              latitude: areaHotspot.latitude,
              longitude: areaHotspot.longitude,
              width: 300,
              height: 300,
              widget: hotspotButton(icon: Icons.open_in_browser, onPressed: () {
                setState(() {
                   currentScene = areaHotspot.nextView;
                   currentArea_Id = getParentKey(areaViewsMap, currentScene);
                   currentArea = getCurrentArea(areas, currentArea_Id);                
                  });
              }),
            ),
          ],
        );
    

    return Scaffold(
      appBar: AppBar(
        title: Text(currentArea!.area_name),
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

/*
    switch(location_id){
      case 0:
          panorama = PanoramaViewer(
          child: Image.asset(areaViewsMap[location_id].image),
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
          child: Image.asset(areaViews_list[image_index].image),
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
          child: Image.asset(areaViews_list[image_index].image),
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
    */

    /*
    if (areaView == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Panorama View Page"),
          backgroundColor: Colors.green,
        ),
        body: const Center(child: CircularProgressIndicator()), // Loading indicator
      );
    }
    */