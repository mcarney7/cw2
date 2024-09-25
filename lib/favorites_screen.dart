import 'package:flutter/material.dart';

// Stateless widget to display the list of favorite recipes
class FavoritesScreen extends StatelessWidget {
  final List<String> favoriteRecipes;  // List of favorite recipes passed from HomeScreen

  FavoritesScreen({required this.favoriteRecipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Recipes'),  // Title for the Favorites screen
      ),
      body: favoriteRecipes.isEmpty
          ? Center(
              // Message if no recipes are marked as favorite
              child: Text(
                'No favorite recipes yet!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: favoriteRecipes.length,  // Number of favorite recipes
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,  // Adds shadow around each favorite recipe card
                  margin: EdgeInsets.all(10),  // Adds space around each card
                  child: ListTile(
                    leading: CircleAvatar(
                      // Displays the image associated with the favorite recipe
                      backgroundImage: AssetImage('assets/image${index + 1}_${favoriteRecipes[index].toLowerCase().replaceAll(" ", "_")}.jpg'),
                    ),
                    title: Text(favoriteRecipes[index]),  // Displays the name of the favorite recipe
                  ),
                );
              },
            ),
    );
  }
}
