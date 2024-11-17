import 'package:flutter/material.dart';

class BuildingDetailPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const BuildingDetailPage({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: image, // Use the same tag as in HomePage
              child: Image.asset(
                image,
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
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
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
      ),
    );
  }
}
