import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

Map<String, dynamic> defaultAppSettings = {
  "panoramaSensitivityValue" : 1.0,
  "gyroSwitch": false
};

Map<String, dynamic> appSettings = {};

Future<String> getWritableDirectory() async {
  final directory = await getApplicationDocumentsDirectory();
  return "${directory.path}/appSettings.json";
}

Future<void> deleteAppSettings() async {
  try {
    String filePath = await getWritableDirectory(); 
    final file = File(filePath);

    if (await file.exists()){
      await file.delete();
      print("File deleted: $filePath");
    } else {
      print("File does not exist: $filePath");
    }
  } catch (e) {
    print("Error deleting file: $e");
  }
}

Future<void> saveSettings() async {
  try {
    String jsonString = jsonEncode(appSettings);

    String filePath = await getWritableDirectory();
    final file = File(filePath);
    
    await file.writeAsString(jsonString);

    print("Settings saved successfully to $filePath");
  } catch (e) {
    print("Error saving settings: $e");
  }

}

Future<void> getSettings() async {
  try {
    String filePath = await getWritableDirectory();
    final file = File(filePath);

    if (await file.exists()){
      String jsonString = await file.readAsString();

      Map<String, dynamic> settingsData = jsonDecode(jsonString);

      appSettings = settingsData;

      print("Settings loaded: $appSettings");
    } else {
      appSettings = defaultAppSettings;
      print("Settings file does not exist. Using default settings");
      print("Settings loaded: $appSettings");
    }
    
  } catch (e) {
    print("Error loading settings: $e");
  }

}

