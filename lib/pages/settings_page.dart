import 'package:erranza/data/appSettings.dart';
import 'package:erranza/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override 
  void dispose() {
    super.dispose();
    saveSettings(); //App Settings will change when the user switches from settings page to another page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Align(
                alignment: Alignment.center,
                child: Image.asset('assets/images/erranzaLogo.png', width: 100, height: 100,)
              ),
            ),
            Divider( color: Colors.grey, thickness: 1,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text("360 View Settings", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 20
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.panorama_photosphere, size: 30),
              title: const Text("View Sensitivity", style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),),
              subtitle: const Text("Adjust the sensitivity of the gesture"),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: SizedBox(
                width: 300,
                child: Slider(
                  value: appSettings["panoramaSensitivityValue"], 
                  min: 1.1,
                  max: 10.1,
                  divisions: 10,
                  activeColor: Color(0xff378B8A),
                  thumbColor: Colors.white,
                  label: appSettings["panoramaSensitivityValue"].round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      appSettings["panoramaSensitivityValue"] = value;
                    });
                  }
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.sensors, size: 30,),
              title: const Text("Gyro Switch", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),),
              subtitle: const Text("Control the Panorama with motion sensors",),
              trailing: Switch(
                      value: appSettings["gyroSwitch"], 
                      activeColor: Color(0xff378B8A),
                      inactiveTrackColor: const Color.fromARGB(255, 129, 129, 129),   
                      inactiveThumbColor: Colors.white,                    
                      onChanged: (value) {
                        setState(() {
                          appSettings["gyroSwitch"] = value;
                      });
                    }),
            ),
            
            Divider(color: Colors.grey, thickness: 1,), 
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text("Other", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 20
                    ),
                  ),
                ),
              ),
            ), 
            ListTile(
              leading: Icon(Icons.lightbulb),
              title: const Text("Quick Tutorial"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TutorialPage()));
              },
            ),

            ListTile(
              leading: Icon(Icons.feedback),
              title: const Text("Feedback"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () async {
                  final url = 'https://forms.gle/NL9ne16fxWPxFd4y5';
                  if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
                    throw Exception("Could not launch $url");
                  }
                }, 
            ),
            /*
            ListTile(
              leading: Icon(Icons.update),
              title: const Text("Check for Updates"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatesPage()));
              },
            ),
            */

            ListTile(
              leading: Icon(Icons.info),
              title: const Text("About"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutAppPage()));
              },
            ),

          ],
      ),
    );
  }
}