

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
  final AreaView? nextScene;

  AreaHotspot(
    this.latitude,
    this.longitude,
    this.nextScene
  );
}


AreaView createAreaView(String image, List<Map<String, dynamic>> hotspotProperties) {
  List<AreaHotspot> hotspots = hotspotProperties.map((data) {

    
    return AreaHotspot(data["latitude"], data["longitude"], data["nextView"]);
  }).toList();

  return AreaView(image, hotspots);
}




Map<String, Map<String, AreaView>> areaViewsMap = {
  "CCJ_B1_F1_A1": {
    "AV1": createAreaView("assets/images/360img.jpeg", [
      {"latitude":-15.0, "longitude": -129.0, "nextView": "CCJ_B1_F1_A1:AV2"},
    ]),
    "AV2": createAreaView("assets/images/360img2.jpeg", [
      {"latitude":-15.0, "longitude": -129.0, "nextView": "CCJ_B1_F1_A1:AV1"},
    ]),
    
  },
  /*
  "CON_B1_F2_A1": {
    "AV1": AreaView("assets/images/360img.jpeg", [AreaHotspot(-15.0, -129.0, areaViewsMap["CCJ_B1_F1_A1"]!["AV2"])]),
    "AV2": AreaView("assets/images/360im2.jpeg", [AreaHotspot(-15.0, -129.0, areaViewsMap["CCJ_B1_F1_A1"]!["AV1"])]),
  },
  */
};


/*
initialize_hotspots() {
  areaViewsMap["CCJ_B1_F1_A1"]!["AV1"]!.areaHotspots.add(
    AreaHotspot(-15.0, -129.0, areaViewsMap["CCJ_B1_F1_A1"]!["AV2"]),
  );

  areaViewsMap["CCJ_B1_F1_A1"]!["AV2"]!.areaHotspots.add(
    AreaHotspot(-15.0, -129.0, areaViewsMap["CCJ_B1_F1_A1"]!["AV1"])
  );
}

*/








