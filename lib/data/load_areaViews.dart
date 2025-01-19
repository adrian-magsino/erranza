import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class AreaView {

  final String sceneId;
  final String image;
  final List<double> initialAngle;
  final List<AreaHotspot> areaHotspots;
  
  
  AreaView(

    this.sceneId,
    this.image,
    this.initialAngle,
    this.areaHotspots
    
  );
}

class AreaHotspot {
  final String type;
  final String? labelText;
  final double width;
  final double height;
  final double latitude;
  final double longitude;
  final String? nextView;
  final List<double> nextViewAngle;

  AreaHotspot(
    this.type,
    this.labelText,
    this.width,
    this.height,
    this.latitude,
    this.longitude,
    this.nextView,
    this.nextViewAngle
  );
}

Map<String, Map<String, AreaView>> areaViewsMap = {};
List<String> jsonFiles = [
  "assets/AreaViews/conAreaViews/conF1_AreaViews.json",
  "assets/AreaViews/conAreaViews/conF2_AreaViews.json",
  "assets/AreaViews/conAreaViews/conF3_AreaViews.json",
  "assets/AreaViews/conAreaViews/conF4_AreaViews.json",

  "assets/AreaViews/ccjAreaViews/ccjF1_AreaViews.json",
  "assets/AreaViews/ccjAreaViews/ccjF2_AreaViews.json",
  "assets/AreaViews/ccjAreaViews/ccjF3_AreaViews.json",
  "assets/AreaViews/ccjAreaViews/ccjF4_AreaViews.json",
  
  "assets/AreaViews/cspearAreaViews/cspearF1_AreaViews.json",
  "assets/AreaViews/cspearAreaViews/cspearF2_AreaViews.json",
  "assets/AreaViews/cspearAreaViews/cspearF3_AreaViews.json",
];

List<String> getSceneIds(String locationId) {
  if (areaViewsMap.containsKey(locationId)) {
    return areaViewsMap[locationId]!.keys.toList();
  }
  return [];
}

Future<Map<String, Map<String, AreaView>>> loadAreaViews() async {
  for (var jsonFile in jsonFiles) {
    String jsonString = await rootBundle.loadString(jsonFile);
    List<dynamic> jsonList = json.decode(jsonString);

    for (var location in jsonList) {
      String locationId = location["location_id"];
      areaViewsMap[locationId] = {};

      for (var view in location["areaViews"]) {
        String sceneId = view["sceneId"];
        //List<double> initialAngle = view["initialAngle"] ;
        areaViewsMap[locationId]![sceneId] = AreaView(
          sceneId,
          view["image"], 
          List<double>.from(view["initialAngle"]), 
          []);
      }
    }

    for (var location in jsonList) {
      String locationId = location["location_id"];

      for (var view in location["areaViews"]) {
        String sceneId = view["sceneId"];
        List<AreaHotspot> areaHotspots = (view["hotspots"] as List).map((hotspotProperties) {

          return AreaHotspot(
            hotspotProperties["type"],
            hotspotProperties["labelText"],
            hotspotProperties["width"],
            hotspotProperties["height"],
            hotspotProperties["latitude"], 
            hotspotProperties["longitude"], 
            hotspotProperties["nextView"],
            List<double>.from(hotspotProperties["nextViewAngle"])
            );

      }).toList();

      areaViewsMap[locationId]![sceneId]!.areaHotspots.addAll(areaHotspots);
      }
    }
  }
  return areaViewsMap;
}









