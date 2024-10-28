import 'package:erranza/data/areas.dart';



List<List<Area>> findDuplicateID(List<Area> areas) {
  Map<String, List<Area>> groupedAreas = {};

  for (var area in areas) {
    String key = "${area.college_id}_${area.building_id}_${area.floor_id}_${area.area_id}";

    if (groupedAreas.containsKey(key)) {
      groupedAreas[key]!.add(area);
    } else {
      groupedAreas[key] = [area];
    }
  }

  List<List<Area>> duplicates = groupedAreas.values.where((group) => group.length > 1).toList();

  return duplicates;
}


bool hasDuplicateID(){
   List<List<Area>> duplicates = findDuplicateID(conAreas);

   if (duplicates.isEmpty) {
    print("No Duplicates Found");
    return false;
   } else {
    print("DUPLICATE IDs WERE FOUND");
    print("APP FAILED TO START");

    for (var duplicateGroup in duplicates){
      print("Duplicate Group:");
      for (var area in duplicateGroup){
        print("ID: ${area.college_id}_${area.building_id}_${area.floor_id}_${area.area_id}");
        print("Area Name: ${area.area_name}");
        print("Building Name: ${area.building_name}");
        print("College Name: ${area.college_name}");
      }
    }
    return true;

   }
}

