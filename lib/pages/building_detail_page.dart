import 'package:erranza/data/areas.dart';
import 'package:erranza/widgets/custom_FilterTags.dart';
import 'package:erranza/widgets/custom_listTile.dart';
import 'package:flutter/material.dart';

class BuildingDetailPage extends StatefulWidget {
  final String title;
  final String subtitle;
  final String image;
  final List<Area> areaList;
  final List<String> floors;

  const BuildingDetailPage({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.areaList,
    required this.floors
  }) : super(key: key);

  @override
  State<BuildingDetailPage> createState() => _BuildingDetailPageState();
}

class _BuildingDetailPageState extends State<BuildingDetailPage> {
  late List<Area> displayedAreas;
  late List<String> floorTags;
  int _selectedFloorIndex = 0;

  @override
  void initState() {
    super.initState();
    floorTags = ["All", ...widget.floors];
    displayedAreas = widget.areaList;
    print(widget.areaList);
  }
  void filterChanged() {setState(() {});}

  void tagSelected(int index) {
    setState(() {
      _selectedFloorIndex = index;
      filterAreas();
    });
  }

  void filterAreas() {
    setState(() {
      final filteredAreas = widget.areaList.where((area) {
        String selectedFloorTag = floorTags[_selectedFloorIndex].substring(0,1);
         return _selectedFloorIndex == 0 || area.floor_id.substring(1,2) == selectedFloorTag;
      }).toList();
      displayedAreas = filteredAreas;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Hero(
                    tag: widget.image, // Use the same tag as in HomePage
                    child: Image.asset(
                      widget.image,
                      fit: BoxFit.cover,
                      height: 300, // Set a height for the image in the detail page
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.subtitle,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        // Add more content here as needed
                      ],
                    ),
                  ),
                  
                  
                ],
              ),
            )
          ];
        },
        body: Column(
          children: [
            Divider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
            CustomFilterTags(
              tagsCollection: floorTags, 
              filterChangedCallback: filterChanged, 
              selectedTagIndex: _selectedFloorIndex, 
              tagSelectedCallback: tagSelected),
            Expanded(
              child: widget.areaList.isNotEmpty ? ListView.separated( 
                itemCount: displayedAreas.length,              
                separatorBuilder: (context, index) => const Divider(), 
                itemBuilder: (context, index) {
                  return CustomListTile(areaList: displayedAreas, areaIndex: index);
                }, 
              ):Center(child: Text("No Areas"),)
            ),
          ],
        ),
        
      ),
    );
  }
}
