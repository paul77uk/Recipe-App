import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'models/Recipe.dart';

class RecipeDetailPage extends StatefulWidget {
  const RecipeDetailPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          SystemUiOverlayStyle(statusBarColor: recipeList[widget.index].color),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              CustomAppBar(index: widget.index),
              Expanded(
                child: ListView(
                  children: [ RecipeCard(index: widget.index),
                    Ingredients(),],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
          color: recipeList[index].color,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 26.0, top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${recipeList[index].title.split(" ").first}\n${recipeList[index].title.split(" ").last}",
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.white70,
                            fontWeight: FontWeight.w900),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Container(
                          width: 150,
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Icon(Icons.access_time_filled,
                                color: Colors.white70),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "${recipeList[index].time} min",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Icon(Icons.person, color: Colors.white70),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "${recipeList[index].servings} servings",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Icon(Icons.local_fire_department,
                                color: Colors.white70),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "675 calories",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RatingBar.builder(
                              itemSize: 16,
                              initialRating: 4.5,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 0.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.white70,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "${recipeList[index].reviews} reviews",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 70),
                  child: ClipOval(
                    child: Image.network(
                      recipeList[index].imageUrl,
                      width: 315,
                      height: 300,
                      fit: BoxFit.none,
                      scale: index == 0 ? 3 : 1.78,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: recipeList[index].color,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () { Navigator.pop(context);},
                icon: Icon(Icons.arrow_back_ios,
                    color: Colors.white70, size: 35)),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notification_add_outlined,
                  color: Colors.white70,
                  size: 35,
                ))
          ],
        ),
      ),
    );
  }
}

class Ingredients extends StatelessWidget {
  const Ingredients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ingredients",
              style: TextStyle(
                  color: Color.fromRGBO(63, 102, 123, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            SizedBox(height: 16,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IngredientsText(text: "Bowtie pasta"),
                      IngredientsText(text: "Salt"),
                      IngredientsText(text: "1/4 cup olive oil"),
                      IngredientsText(
                          text:
                              "Fresh veggies: red onion, carrot, broccoli, bell pepper, yellow squash, zucchini, tomatoes and garlic"),
                    ],
                  ),
                ),
                SizedBox(width: 5,),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IngredientsText(text: "2 tsp dried italian seasoning"),
                      IngredientsText(text: "2 Tbsp fresh lemon juice"),
                      IngredientsText(text: "2 Tbsp chopped frsh parsley"),
                      IngredientsText(
                          text:
                          "1/4 cup shredded parmigiano divided"),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class IngredientsText extends StatelessWidget {
  const IngredientsText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "\u2022",
          style: TextStyle(
              color: Color(0xFFC9B63D),
              fontWeight: FontWeight.bold,
              fontSize: 14),
        ),
        SizedBox(width: 5),
        Flexible(
          child: Text(
            text,
            style: TextStyle(color: Colors.grey[500], fontSize: 14),
          ),
        )
      ],
    );
  }
}
