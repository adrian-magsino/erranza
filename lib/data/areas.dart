import 'dart:convert';
import 'package:flutter/services.dart';

class Area {
  final String college_id;
  final String building_id;
  final String floor_id;
  final String area_id;
  final String icon;
  final String area_name;
  final String building_name;
  final String college_name;

  Area({
    required this.college_id,
    required this.building_id,
    required this.floor_id,
    required this.area_id,
    required this.icon,
    required this.area_name,
    required this.building_name,
    required this.college_name
  });

  factory Area.fromJson(Map<String, dynamic> json) {
    return Area(
      college_id: json["college_id"],
      building_id: json["building_id"],
      floor_id: json["floor_id"],
      area_id: json["area_id"],
      icon: json["icon"],
      area_name: json["area_name"],
      building_name: json["building_name"],
      college_name: json["college_name"],
    );
  }
}

List<Area> allAreas = [...ccjAreas, ...conAreas, ...cspearAreas];

List<Area> get ccjAreas => [...ccjF1_areas, ...ccjF2_areas, ...ccjF3_areas, ...ccjF4_areas];
List<Area> get conAreas => [...conF1_areas, ...conF2_areas];
List<Area> get cspearAreas => [...cspearF1_areas, ...cspearF2_areas, ];
List<Area> emptyArea = [];

List<Area> conF1_areas = [];
List<Area> conF2_areas = [];

List<Area> ccjF1_areas = [];
List<Area> ccjF2_areas = [];
List<Area> ccjF3_areas = [];
List<Area> ccjF4_areas = [];

List<Area> cspearF1_areas = [];
List<Area> cspearF2_areas = [];

Map<String, List<Area>> collegeAreas = {
  "CCJ": ccjAreas,
  "CON": conAreas,
  "CSPEAR": cspearAreas
};

