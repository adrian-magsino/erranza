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
  final AreaView? nextView;

  AreaHotspot(
    this.latitude,
    this.longitude,
    this.nextView
  );
}

Map<String, Map<String, AreaView>> areaViewsMap = {};

Future<Map<String, Map<String, AreaView>>> loadAreaViews() async {
  String jsonString = await rootBundle.loadString("assets/area_views.json");
  Map<String, dynamic> jsonMap = json.decode(jsonString);

  jsonMap.forEach((areaViewKey, areaViewValue) {
    areaViewsMap[areaViewKey]= {};
    areaViewValue.forEach((viewKey, viewValue) {
      areaViewsMap[areaViewKey]![viewKey] = AreaView(viewValue["image"], []);
    });
  });


  jsonMap.forEach((areaViewKey, areaViewValue) {
    
    areaViewValue.forEach((viewKey, viewValue) {
      List<AreaHotspot> areaHotspots = (viewValue["hotspots"] as List).map((hotspotProperties) {
 

        String nextViewKey = hotspotProperties["nextView"];
        AreaView? nextView;
        
        var nextViewId = nextViewKey.split(":");
        
        
        String nextAreaKey = nextViewId[0];
        String nextAreaViewKey = nextViewId[1];

        nextView = areaViewsMap[nextAreaKey]?[nextAreaViewKey];
        if (nextView == null){print("WALANG LAMAN ITO");}
        

        return AreaHotspot(
          hotspotProperties["latitude"], 
          hotspotProperties["longitude"], 
          nextView);

      }).toList();

      areaViewsMap[areaViewKey]![viewKey]!.areaHotspots.addAll(areaHotspots);

      });
  });
  return areaViewsMap;
}









