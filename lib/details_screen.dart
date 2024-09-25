import 'package:flutter/material.dart';

// Stateful widget for displaying recipe details and marking them as favorites
class DetailsScreen extends StatefulWidget {
  final String recipe;  // The recipe name
  final bool isFavorite;  // Whether the recipe is currently a favorite

  DetailsScreen({required this.recipe, required this.isFavorite});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late bool isFavorite;  // Local variable to track if the recipe is a favorite

  // Dictionary holding details for each recipe (ingredients, instructions, and image)
  final Map<String, Map<String, dynamic>> recipesData = {
    "Spaghetti Carbonara": {
      "image": 'assets/image1_spaghetti_carbonara.jpg',
      "ingredients": "• Spaghetti\n• Pancetta\n• Eggs\n• Parmesan Cheese\n• Black Pepper",
      "instructions": "1. Cook spaghetti\n2. Fry pancetta\n3. Mix eggs and cheese\n4. Combine with pasta\n5. Season with pepper"
    },
    "Chicken Alfredo": {
      "image": 'assets/image2_chicken_alfredo.jpg',
      "ingredients": "• Fettuccine\n• Chicken breast\n• Heavy cream\n• Parmesan Cheese\n• Garlic",
      "instructions": "1. Cook fettuccine\n2. Sear chicken\n3. Make Alfredo sauce with cream and cheese\n4. Combine with pasta"
    },
    "Beef Stroganoff": {
      "image": 'assets/image3_beef_stroganoff.jpg',
      "ingredients": "• Beef strips\n• Mushrooms\n• Sour cream\n• Onion\n• Egg noodles",
      "instructions": "1. Sauté onions and beef\n2. Add mushrooms\n3. Stir in sour cream\n4. Serve over egg noodles"
    },
    "Lemon Garlic Shrimp": {
      "image": 'assets/image4_lemon_garlic_shrimp.jpg',
      "ingredients": "• Shrimp\n• Garlic\n• Lemon juice\n• Butter\n• Parsley",
      "instructions": "1. Sauté garlic in butter\n2. Add shrimp\n3. Stir in lemon juice\n4. Garnish with parsley"
    },
    "Vegetarian Chili": {
      "image": 'assets/image5_vegetarian_chili.jpg',
      "ingredients": "• Kidney beans\n• Black beans\n• Tomatoes\n• Onion\n• Chili powder",
      "instructions": "1. Sauté onions\n2. Add beans and tomatoes\n3. Simmer with chili powder"
    },
  };

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;  // Sets the initial favorite status from the HomeScreen
  }

  @override
  Widget build(BuildContext context) {
    final recipeData = recipesData[widget.recipe];  // Fetches data for the current recipe
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe),  // Displays the recipe name at the top
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                recipeData!['image'],  // Displays the image for the recipe
                height: 200,
              ),
            ),
            SizedBox(height: 20),
            Text(
              widget.recipe,  // Recipe name
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "Ingredients:",  // Section header for ingredients
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(recipeData['ingredients']),  // Displays the ingredients
            SizedBox(height: 16),
            Text(
              "Instructions:",  // Section header for instructions
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(recipeData['instructions']),  // Displays the instructions
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    // Favorite icon based on favorite status
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : null,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;  // Toggles the favorite status
                    });
                    Navigator.pop(context, isFavorite);  // Passes the new status back to the HomeScreen
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
