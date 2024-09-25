import 'package:flutter/material.dart';
import 'home_screen.dart';

// Main function to start the app
void main() {
  runApp(RecipeApp());  // Runs the app using the RecipeApp class
}

// This is the main widget of the app, setting up the theme and starting screen
class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Book',  // The title of the app
      theme: ThemeData(
        primarySwatch: Colors.green,  // Sets a green color scheme for the app
        visualDensity: VisualDensity.adaptivePlatformDensity,  // Adjusts layout for platform differences
      ),
      home: HomeScreen(),  // Sets the starting screen of the app to the HomeScreen widget
      debugShowCheckedModeBanner: false,  // Removes the debug banner
    );
  }
}

