import 'package:erranza/data/areas.dart';
import 'package:erranza/widgets/custom_listTile.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();
  List areaList = allAreas;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
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
                      _controller.clear(); setState((){}); 
                      }, 
                    )
                  : null,
              ),
              onChanged: searchArea,
            ),
          ),
          areaList.isNotEmpty ? Expanded(
            child: ListView.separated(
            itemCount: areaList.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              return CustomListTile(areaList: areaList, areaIndex: index,);
              }
            )
          )
          :Center(
            child: Text("Area not Found"),
          )         
        ],          
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
      areaName.contains(userInput)     
      ;
    }).toList();

    setState(() => areaList = suggestions);
  }
  
}


