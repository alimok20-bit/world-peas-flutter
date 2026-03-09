import 'package:flutter/material.dart';

void main() {
  runApp(WorldPeasApp());
}

class WorldPeasApp extends StatelessWidget {
  const WorldPeasApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World Peas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "World Peas",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),

            SizedBox(height: 20),

            Text(
              "Fresh groceries delivered",
              style: TextStyle(fontSize: 18),
            ),

            SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {},
              child: Text("Start Shopping"),
            ),

            SizedBox(height: 10),

            TextButton(
              onPressed: () {},
              child: Text("Guest Mode"),
            )
          ],
        ),
      ),
    );
  }
}