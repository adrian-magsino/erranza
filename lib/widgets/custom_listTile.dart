import 'package:erranza/data/areas.dart';
import 'package:erranza/pages/panorama_view_page.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.areaIndex,
  });

  final int areaIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => PanoramaViewPage(
            initialArea: areas[areaIndex],
            ),
          ),
        );
      },
      child:ListTile(
    leading: Image.asset(areas[areaIndex].icon, width: 64.8961067199707, height: 60),

    title: Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 10.0),
      child: Text(areas[areaIndex].area_name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
    ),
    
    isThreeLine: true,

    subtitle: Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(text: "${areas[areaIndex].building_name}\n", 
            style: TextStyle(
              color: Colors.black, 
              fontSize: 14, 
              fontWeight: FontWeight.w400)),
              
            TextSpan(text: areas[areaIndex].college_name, 
            style: TextStyle(
              color: Colors.black, 
              fontSize: 14, 
              fontWeight: FontWeight.w400)),
          ]
        )
      ),
    )
    )
    );
  }
}