import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.cyanAccent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Center(
                  child: Text(style: TextStyle(fontSize: 50), "J's Planner"),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/plan');
                    // Navigator.of(context).push(
                    //   Meterial
                    // )
                  },
                  child: Text("Start to plan"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
