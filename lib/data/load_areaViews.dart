import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class AreaView {

  final String image;
  final List<AreaHotspot> areaHotspots;
  
  AreaView(

    this.image,
    this.areaHotspots
  );
}

class AreaHotspot {
  final double latitude;
  final double longitude;
  final String nextView;

  AreaHotspot(
    this.latitude,
    this.longitude,
    this.nextView
  );
}

Map<String, Map<String, AreaView>> areaViewsMap = {};

Future<Map<String, Map<String, AreaView>>> loadAreaViews() async {
  String jsonString = await rootBundle.loadString("assets/area_views.json");
  List<dynamic> jsonList = json.decode(jsonString);

  for (var location in jsonList) {
    String locationId = location["location_id"];
    areaViewsMap[locationId] = {};

    for (var view in location["areaViews"]) {
      String sceneId = view["sceneId"];
      areaViewsMap[locationId]![sceneId] = AreaView(view["image"], []);
    }
  }

  for (var location in jsonList) {
    String locationId = location["location_id"];

    for (var view in location["areaViews"]) {
      String sceneId = view["sceneId"];
      List<AreaHotspot> areaHotspots = (view["hotspots"] as List).map((hotspotProperties) {

        return AreaHotspot(
          hotspotProperties["latitude"], 
          hotspotProperties["longitude"], 
          hotspotProperties["nextView"]
          );

    }).toList();

    areaViewsMap[locationId]![sceneId]!.areaHotspots.addAll(areaHotspots);
    }
  }

  return areaViewsMap;
}









