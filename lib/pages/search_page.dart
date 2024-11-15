import 'package:erranza/data/areas.dart';
import 'package:erranza/widgets/custom_FilterTags.dart';
import 'package:erranza/widgets/custom_listTile.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();

  List<String> collegeTags = ["All", "CCJ", "CON", "CSPEAR"];
  List<String> buildingTags = ["All", "CCJ Building", "CON Building", "University Gym"];
  List<String> floorTags = ["All", "1st Floor", "2nd Floor", "3rd Floor", "4th Floor", "5th Floor"];

  int _selectedCollegeTagIndex = 0;
  int _selectedBuildingTagIndex = 0;
  int _selectedFloorTagIndex = 0;
  
  void filterChanged() {setState(() {});}
  
  void tagSelected(int index) {
    setState(() {
      _selectedCollegeTagIndex = index;
      filterAreas();
    });
  }

  void buildingTagSelected(int index) {
    setState(() {
      _selectedBuildingTagIndex = index;
      filterAreas();
    });
  }

  void floorTagSelected(int index) {
    setState(() {
      _selectedFloorTagIndex = index;
      filterbyFloor();
    });
  }

  void filterbyFloor() {
    setState(() {
      filteredAreasbyFloor = filteredAreas.where((area) {
        String selectedFloorTag = floorTags[_selectedFloorTagIndex].substring(0,1); //convert floor text to floor number

        return _selectedFloorTagIndex == 0 || area.floor_id.substring(1,2) == selectedFloorTag;
      }).toList();
      displayedAreasList = filteredAreasbyFloor;
      
    });
  }

  void filterAreas () {
    setState(() {
      filteredAreas = allAreas.where((area) {
        String selectedCollegeTag = collegeTags[_selectedCollegeTagIndex];
        String selectedBuildingTag = buildingTags[_selectedBuildingTagIndex];

        return _selectedCollegeTagIndex == 0 &&
        _selectedBuildingTagIndex == 0 || 
        area.college_id == selectedCollegeTag || 
        area.building_name == selectedBuildingTag;
      
      }).toList();
      displayedAreasList = filteredAreas;
      _selectedFloorTagIndex = 0;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: Column(
          children: [
            const Text("Colleges"),
            CustomFilterTags(
            tagsCollection: collegeTags, 
            filterChangedCallback: filterChanged, 
            selectedTagIndex: _selectedCollegeTagIndex, 
            tagSelectedCallback: tagSelected,),
            SizedBox(height: 40.0),

            const Text("Buildings"),
            CustomFilterTags(
            tagsCollection: buildingTags, 
            filterChangedCallback: filterChanged, 
            selectedTagIndex: _selectedBuildingTagIndex, 
            tagSelectedCallback: buildingTagSelected,),
            SizedBox(height: 40.0),

            const Text("Floors"),
            CustomFilterTags(
            tagsCollection: floorTags, 
            filterChangedCallback: filterChanged, 
            selectedTagIndex: _selectedFloorTagIndex, 
            tagSelectedCallback: floorTagSelected,),
          ],
        )
      ),
      body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Search for an Area",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.blue)
                        ),
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: _controller.text.isNotEmpty ?
                          IconButton(
                            icon: Icon(Icons.clear), 
                            onPressed: () {
                              _controller.clear(); setState((){ displayedAreasList = allAreas;}); 
                              }, 
                            )
                          : null,
                      ),
                      onChanged: searchArea,
                    ),
                  ),
                ),
                Container(
                  child: Builder(builder: (context) => IconButton(
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    }, 
                    icon: Icon(Icons.sort))),
                )
              ],
            ),
            displayedAreasList.isNotEmpty ? Expanded(
              child: ListView.separated(
              itemCount: displayedAreasList.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return CustomListTile(areaList: displayedAreasList, areaIndex: index,);
                }
              )
            )
            :Center(
              child: Text("Area not Found"),
            )         
          ],          
      ),
    );    
  }
  
  void searchArea(String query) {
    final suggestions = allAreas.where((area) {
      final collegeId = area.college_id.toLowerCase();
      final collegeName = area.college_name.toLowerCase();
      final buildingName = area.building_name.toLowerCase();
      final areaName = area.area_name.toLowerCase();
      final userInput = query.toLowerCase().trim();

      return collegeId.contains(userInput) ||
      collegeName.contains(userInput) || 
      buildingName.contains(userInput) ||
      areaName.contains(userInput);
    }).toList();

    setState(() {
      displayedAreasList = suggestions;
      filteredAreas = allAreas;
      filteredAreasbyFloor = allAreas;
      _selectedCollegeTagIndex = 0;
      _selectedBuildingTagIndex = 0;
      _selectedFloorTagIndex = 0;
    });
  }
  
}

