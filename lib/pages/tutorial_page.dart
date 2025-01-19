import 'package:flutter/material.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quick Tutorial"),
        backgroundColor: Colors.green[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildImageWithText(
              context,
              'assets/images/tutorialImages/homeTutorial1.jpg',
              'Choose the building you want to explore',
            ),
            _buildImageWithText(
              context,
              'assets/images/tutorialImages/bldgTutorial1.jpg',
              'Here you can browse the list of areas in your selected building. You can use the floor tags to filter out the displayed areas based on the selected floor.',
            ),
            _buildImageWithText(
              context,
              'assets/images/tutorialImages/panoramaTutorial1.jpg',
              'Pan around to explore the area in 360 view. Click the hotspots you see around the area to switch between areas',
            ),
            _buildImageWithText(
              context,
              'assets/images/tutorialImages/searchTutorial1.jpg',
              'Here you can search for an area or room based on their name. ',
            ),
            _buildImageWithText(
              context,
              'assets/images/tutorialImages/filterTutorial1.jpg',
              'You can also use filter tags to filter out the displayed areas. Click the button or slide from the right to display filter panel',
            ),
            _buildImageWithText(
              context,
              'assets/images/tutorialImages/filterTutorial2.jpg',
              'Select tags to filter the displayed areas in the list',
            ),
            _buildImageWithText(
              context,
              'assets/images/tutorialImages/settingsTutorial1.jpg',
              'In the settings page, you can change the sensitivity when panning around the 360 image. You can also enable Gyro Switch to view 360 images with your device’s motion sensor',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWithText(BuildContext context, String imagePath, String text) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              text,
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}