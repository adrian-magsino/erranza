import 'package:erranza/data/areas.dart';
import 'package:flutter/material.dart';
import 'building_detail_page.dart'; // Import your detail page

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the buildings list as a local variable
    final List<Map<String, dynamic>> buildings = [
      {
        'image': 'assets/images/temporaryCardpics/bldg1.jpg',
        'title': 'CCJ Building',
        'subtitle': 'College of Criminal Justice',
        'areaList': ccjAreas,
        'floors': ["1st Floor", "2nd Floor", "3rd Floor", "4th Floor"],
      },
      {
        'image': 'assets/images/temporaryCardpics/bldg2.jpg',
        'title': 'CON Building',
        'subtitle': 'College of Nursing',
        'areaList': conAreas,
        'floors': ["1st Floor", "2nd Floor", "3rd Floor", "4th Floor", "5th Floor"],
      },
      {
        'image': 'assets/images/temporaryCardpics/bldg3.jpg',
        'title': 'Main Library',
        'subtitle': 'University Library',
        'areaList': emptyArea,
        'floors': ["1st Floor", "2nd Floor", "3rd Floor", "4th Floor"],
      },
      {
        'image': 'assets/images/temporaryCardpics/bldg4.jpg',
        'title': 'University Gym',
        'subtitle': 'College of Sports, Physical Education and Recreation',
        'areaList': cspearAreas,
        'floors': ["1st Floor", "2nd Floor", "3rd Floor"],
      },
      {
        'image': 'assets/images/temporaryCardpics/bldg5.jpg',
        'title': 'Arts and Communication',
        'subtitle': 'College of Arts and Communication',
        'areaList': emptyArea,
        'floors': ["1st Floor", "2nd Floor", "3rd Floor", "4th Floor"],
      },
      {
        'image': 'assets/images/temporaryCardpics/bldg6.jpg',
        'title': 'Student Center',
        'subtitle': 'Campus Hub for Students',
        'areaList': emptyArea,
        'floors': ["1st Floor", "2nd Floor", "3rd Floor", "4th Floor"],
      },
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Add padding around the entire GridView
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          itemCount: buildings.length,
          itemBuilder: (context, index) {
            final building = buildings[index];
            return Padding(
              padding: const EdgeInsets.all(4.0), // Add edge insets around each card
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BuildingDetailPage(
                        title: building['title']!,
                        subtitle: building['subtitle']!,
                        image: building['image']!,
                        areaList: building['areaList'],
                        floors: building['floors'],
                      ),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0), // Set the radius for all corners
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Left align the content
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)), // Round only the top corners
                        child: Container(
                          height: 120, // Set a uniform height for the image
                          width: double.infinity,
                          child: Image.asset(
                            building['image']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Ensure text is left-aligned
                          children: [
                            Text(
                              building['title']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16, // Optional: Adjust font size as needed
                              ),
                              overflow: TextOverflow.ellipsis, // Add this line
                              maxLines: 1, // Limit to 1 line
                            ),
                            const SizedBox(height: 4),
                            Text(
                              building['subtitle']!,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14, // Optional: Adjust font size as needed
                              ),
                              overflow: TextOverflow.ellipsis, // Add this line
                              maxLines: 2, // Limit to 1 line
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
