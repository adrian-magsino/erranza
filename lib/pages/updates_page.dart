import 'package:flutter/material.dart';

class UpdatesPage extends StatelessWidget {
  const UpdatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Updates"),
        backgroundColor: Colors.green[800],
      ),
      body: Center(
        child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/erranzaLogo.png', width: 100, height: 100,)
                ),
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              Spacer(),
              Center(
                child: const Text("No Available Updates", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),),
              ),
              Spacer(),
            ],
          ),
      ),
    );
  }
}