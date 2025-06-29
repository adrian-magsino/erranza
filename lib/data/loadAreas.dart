import 'dart:convert';
import 'package:erranza/data/areas.dart';
import 'package:flutter/services.dart';

Future<void> load_areas_data() async {
  //FETCH JSON DATA
  String conF1_jsonString = await rootBundle.loadString("assets/Areas/conAreas/conF1_areas.json");
  String conF2_jsonString = await rootBundle.loadString("assets/Areas/conAreas/conF2_areas.json");
  String conF3_jsonString = await rootBundle.loadString("assets/Areas/conAreas/conF3_areas.json");
  String conF4_jsonString = await rootBundle.loadString("assets/Areas/conAreas/conF4_areas.json");

  String ccjF1_jsonString = await rootBundle.loadString("assets/Areas/ccjAreas/ccjF1_areas.json"); 
  String ccjF2_jsonString = await rootBundle.loadString("assets/Areas/ccjAreas/ccjF2_areas.json"); 
  String ccjF3_jsonString = await rootBundle.loadString("assets/Areas/ccjAreas/ccjF3_areas.json"); 
  String ccjF4_jsonString = await rootBundle.loadString("assets/Areas/ccjAreas/ccjF4_areas.json"); 

  String cspearF1_jsonString = await rootBundle.loadString("assets/Areas/cspearAreas/cspearF1_areas.json");
  String cspearF2_jsonString = await rootBundle.loadString("assets/Areas/cspearAreas/cspearF2_areas.json");
  String cspearF3_jsonString = await rootBundle.loadString("assets/Areas/cspearAreas/cspearF3_areas.json");

  //DECODE JSON DATA
  List<dynamic> conF1_jsonList = jsonDecode(conF1_jsonString);
  List<dynamic> conF2_jsonList = jsonDecode(conF2_jsonString);
  List<dynamic> conF3_jsonList = jsonDecode(conF3_jsonString);
  List<dynamic> conF4_jsonList = jsonDecode(conF4_jsonString);

  List<dynamic> ccjF1_jsonList = jsonDecode(ccjF1_jsonString);
  List<dynamic> ccjF2_jsonList = jsonDecode(ccjF2_jsonString);
  List<dynamic> ccjF3_jsonList = jsonDecode(ccjF3_jsonString);
  List<dynamic> ccjF4_jsonList = jsonDecode(ccjF4_jsonString);

  List<dynamic> cspearF1_jsonList = jsonDecode(cspearF1_jsonString);
  List<dynamic> cspearF2_jsonList = jsonDecode(cspearF2_jsonString);
  List<dynamic> cspearF3_jsonList = jsonDecode(cspearF3_jsonString);

  //CONVERT TO OBJECT AND ADD TO LISTS
  conF1_areas = conF1_jsonList.map((json) => Area.fromJson(json)).toList();
  conF2_areas = conF2_jsonList.map((json) => Area.fromJson(json)).toList();
  conF3_areas = conF3_jsonList.map((json) => Area.fromJson(json)).toList();
  conF4_areas = conF4_jsonList.map((json) => Area.fromJson(json)).toList();

  ccjF1_areas = ccjF1_jsonList.map((json) => Area.fromJson(json)).toList();
  ccjF2_areas = ccjF2_jsonList.map((json) => Area.fromJson(json)).toList();
  ccjF3_areas = ccjF3_jsonList.map((json) => Area.fromJson(json)).toList();
  ccjF4_areas = ccjF4_jsonList.map((json) => Area.fromJson(json)).toList();

  cspearF1_areas = cspearF1_jsonList.map((json) => Area.fromJson(json)).toList();
  cspearF2_areas = cspearF2_jsonList.map((json) => Area.fromJson(json)).toList();
  cspearF3_areas = cspearF3_jsonList.map((json) => Area.fromJson(json)).toList();

}