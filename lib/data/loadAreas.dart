import 'dart:convert';
import 'package:erranza/data/areas.dart';
import 'package:flutter/services.dart';

Future<void> load_areas_data() async {
  String conF1_jsonString = await rootBundle.loadString("assets/Areas/conAreas/conF1_areas.json");
  String conF2_jsonString = await rootBundle.loadString("assets/Areas/conAreas/conF2_areas.json");

  String ccjF1_jsonString = await rootBundle.loadString("assets/Areas/ccjAreas/ccjF1_areas.json"); 

  String cspearF1_jsonString = await rootBundle.loadString("assets/Areas/cspearAreas/cspearF1_areas.json");

  List<dynamic> conF1_jsonList = jsonDecode(conF1_jsonString);
  List<dynamic> conF2_jsonList = jsonDecode(conF2_jsonString);

  List<dynamic> ccjF1_jsonList = jsonDecode(ccjF1_jsonString);

  List<dynamic> cspearF1_jsonList = jsonDecode(cspearF1_jsonString);

  conF1_areas = conF1_jsonList.map((json) => Area.fromJson(json)).toList();
  conF2_areas = conF2_jsonList.map((json) => Area.fromJson(json)).toList();

  ccjF1_areas = ccjF1_jsonList.map((json) => Area.fromJson(json)).toList();

  cspearF1_areas = cspearF1_jsonList.map((json) => Area.fromJson(json)).toList();

}