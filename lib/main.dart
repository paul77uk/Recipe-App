import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:recipe_app/models/Recipe.dart';
import 'package:recipe_app/recipe_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Color.fromRGBO(47, 90, 112, 1.0),
      ),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(47, 90, 112, 1.0),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.grey,
                      size: 35,
                    ),
                    Icon(
                      Icons.notification_add_outlined,
                      color: Colors.grey,
                      size: 35,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Text(
                      "Hi, Connor",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "What do you want to cook today?",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Icon(Icons.search, color: Colors.grey[400]),
                          ),
                          hintText: "Search recipes",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Most Popular Recipes",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 350,
                      child: ListView.builder(
                          itemCount: recipeList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return RecipeCard(
                              color: recipeList[index].color,
                              imageUrl: recipeList[index].imageUrl.toString(),
                              scale: recipeList[index].scale,
                              time: recipeList[index].time,
                              reviews: recipeList[index].reviews,
                              recipeTitle: recipeList[index].title.toString(),
                              onTap: () =>
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              RecipeDetailPage(
                                                  index: index,
                                              )
                                      )),
                            );
                           }
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 80,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Icon(
                              Icons.restaurant,
                              color: Colors.white38,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            MenuSections(title: "STARTERS"),
                            MenuSections(title: "MEAT"),
                            MenuSections(title: "VEGETARIAN"),
                            MenuSections(title: "VEGAN"),
                            MenuSections(title: "DESSERTS"),
                            MenuSections(title: "DRINKS"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 32,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromRGBO(47, 90, 112, 1.0),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.white38,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                color: Colors.white38,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search_outlined,
                color: Colors.white38,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                color: Colors.white38,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------------------
//-------------------------------------------------------

class RecipeCard extends StatelessWidget {
  const RecipeCard({Key? key,
    required this.color,
    required this.imageUrl,
    required this.scale,
    required this.recipeTitle,
    required this.onTap, required this.time, required this.reviews})
      : super(key: key);

  final Color? color;
  final String imageUrl;
  final double scale;
  final int time;
  final int reviews;
  final String recipeTitle;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 260,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: color,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40, top: 10.0),
                  child: ClipOval(
                    child: Image.network(
                      imageUrl,
                      width: 200,
                      height: 200,
                      fit: BoxFit.none,
                      scale: scale,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  recipeTitle,
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 185,
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.white70,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.access_time_filled,
                      color: Colors.white70,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "$time min",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Icon(
                      Icons.person,
                      color: Colors.white70,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "2 servings",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
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
                      itemBuilder: (context, _) =>
                          Icon(
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
                      "$reviews reviews",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//-------------------------------------

class MenuSections extends StatelessWidget {
  const MenuSections({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color.fromRGBO(28, 57, 85, 1.0),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            title,
            style: TextStyle(color: Colors.grey[400]),
          ),
        ),

        // color: Color.fromRGBO(17, 36, 54, 1.0),
      ),
    );
  }
}
