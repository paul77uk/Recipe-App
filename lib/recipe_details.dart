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
        children: [RecipeCard(index: widget.index)],
      ))),
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
      height: 450,
      decoration: BoxDecoration(
          color: recipeList[index].color,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      child: Column(
        children: [
          CustomAppBar(),
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
                            Icon(Icons.access_time_filled, color: Colors.white70),
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
                              itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
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
                      width: 275,
                      height: 200,
                      fit: BoxFit.none,
                      scale: 3.5,
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
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
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
