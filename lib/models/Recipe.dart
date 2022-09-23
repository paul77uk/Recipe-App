import 'package:flutter/material.dart';

class Recipe {
  String imageUrl;
  String title;
  int time;
  int servings;
  double rating;
  int reviews;
  Color color;
  double scale;

  Recipe({
    required this.title,
    required this.time,
    required this.servings,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
    required this.color,
    required this.scale,
  });
}

List<Recipe> recipeList = [
  Recipe(
    imageUrl:
        "https://zardyplants.com/wp-content/uploads/2021/07/Vegan-Pasta-Primavera-04.jpg",
    title: "Pasta Primavera",
    time: 30,
    servings: 2,
    rating: 4.5,
    reviews: 347,
    color: Color.fromRGBO(237, 138, 92, 1),
    scale: 4.75
  ),
  Recipe(
    imageUrl:
        "https://lhcdn.mars.com/cdn-cgi/image/width=1360,height=583,f=auto,quality=90/adaptivemedia/rendition/id_70f97189ac211b308eef2fee6c9b9de0810f4d92/name_70f97189ac211b308eef2fee6c9b9de0810f4d92.jpg",
    title: "Chicken Stir-Fry",
    time: 25,
    servings: 2,
    rating: 4.5,
    reviews: 254,
    color: Color.fromRGBO(174, 114, 133, 1),
    scale: 2.87,
  )
];
