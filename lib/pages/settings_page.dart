import 'package:erranza/data/appSettings.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text("User Support", style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20
                          ),
                        ),
                      ),
                    ),
                  ),
        
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ElevatedButton(
                      onPressed: () {}, 
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        backgroundColor: Color(0xff378B8A),
                        minimumSize: Size(200, 40)
                      ),
                      child: Text("Quick Tutorial", style: TextStyle(
                        color: Colors.white,
                        ),
                      ), 
                    ),
                  ),
        
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ElevatedButton(
                      onPressed: () {}, 
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        backgroundColor: Color(0xff378B8A),
                        minimumSize: Size(200, 40)
                      ),
                      child: Text("Check for Updates", style: TextStyle(
                        color: Colors.white,
                        ),
                      ), 
                    ),
                  ),
        
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 45.0),
                      child: Text("Feedback and Suggestions"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: SizedBox(
                      width: 300,
                      height: 60,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Write Here",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          )
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 40.0),
                      child: ElevatedButton(
                        onPressed: () {}, 
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          backgroundColor: Color(0xff378B8A)
                        ),
                        child: Text("Send", style: TextStyle(
                          color: Colors.white,
                          ),
                        ), 
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text("360-Image View Settings", style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20
                          ),
                        ),
                      ),
                    ),
                  ),
        
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 45.0),
                      child: Text("View Sensitivity"),
                    ),
                  ),  
        
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: SizedBox(
                      width: 300,
                      child: Slider(
                        value: panoramaSensitivityValue, 
                        min: 1,
                        max: 10,
                        divisions: 10,
                        activeColor: Color(0xff378B8A),
                        thumbColor: Colors.white,
                        label: panoramaSensitivityValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            panoramaSensitivityValue = value;
                          });
                        }
                      ),
                    ),
                  ),
        
                  
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Row(
                      children: [
                        Text("Gyro Switch"),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Switch(
                            value: gyroSwitch, 
                            activeColor: Color(0xff378B8A),
                            inactiveTrackColor: const Color.fromARGB(255, 129, 129, 129),   
                            inactiveThumbColor: Colors.white,                    
                            onChanged: (value) {
                              setState(() {
                                gyroSwitch = value;
                            });
                          }),
                        )
                      ],
                    ),
                  )      
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}