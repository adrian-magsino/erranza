import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Feedback Online"),
        backgroundColor: Colors.green[800],
      ),
      body: Center(
        child: Column(
          children: [
            Text("Send your feedback and suggestions online"),
            ElevatedButton(
              onPressed: () async {
                  final url = 'https://youtu.be/dQw4w9WgXcQ?si=kLEdVSwuT0LCuezx';
                  if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
                    throw Exception("Could not launch $url");
                  }
                }, 
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                backgroundColor: Color(0xff378B8A),
                minimumSize: Size(200, 40)
              ),
              child: Text("Open Link", style: TextStyle(
                color: Colors.white,
                ),
              ), 
            ),
          ],
        ),
      ),
    );
  }
}


/*
() async {
                final url = 'https://youtu.be/dQw4w9WgXcQ?si=kLEdVSwuT0LCuezx';
                if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
                  throw Exception("Could not launch $url");
                }
              },
*/