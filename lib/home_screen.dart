import 'package:flutter/material.dart';
import 'details_screen.dart';  // Imports the details screen to allow navigation
import 'favorites_screen.dart';  // Imports the favorites screen to allow navigation

// HomeScreen is a stateful widget to manage favorite recipes and navigation
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List of recipe names
  List<String> recipes = [
    "Spaghetti Carbonara",
    "Chicken Alfredo",
    "Beef Stroganoff",
    "Lemon Garlic Shrimp",
    "Vegetarian Chili"
  ];

  // List to track the user's favorite recipes
  List<String> favoriteRecipes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Book'),  // The title at the top of the screen
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),  // The icon for navigating to the Favorites screen
            onPressed: () {
              // Navigates to the FavoritesScreen, passing the list of favorite recipes
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(favoriteRecipes: favoriteRecipes),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: recipes.length,  // The number of items in the recipe list
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,  // Gives the list items a shadow effect
            margin: EdgeInsets.all(10),  // Adds space around each card
            child: ListTile(
              leading: CircleAvatar(
                // Shows an image associated with each recipe
                backgroundImage: AssetImage('assets/image${index + 1}_${recipes[index].toLowerCase().replaceAll(" ", "_")}.jpg'),
              ),
              title: Text(recipes[index]),  // Displays the recipe name
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,  // The arrow icon to indicate navigation
              ),
              onTap: () async {
                // Navigates to the DetailsScreen, passing the recipe name and favorite status
                final bool isFavorite = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      recipe: recipes[index],
                      isFavorite: favoriteRecipes.contains(recipes[index]),
                    ),
                  ),
                );

                // Updates the favoriteRecipes list based on user actions
                setState(() {
                  if (isFavorite && !favoriteRecipes.contains(recipes[index])) {
                    favoriteRecipes.add(recipes[index]);
                  } else if (!isFavorite && favoriteRecipes.contains(recipes[index])) {
                    favoriteRecipes.remove(recipes[index]);
                  }
                });
              },
            ),
          );
        },
      ),
    );
  }
}

