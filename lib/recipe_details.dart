import 'package:flutter/material.dart';

class RecipeDetailPage extends StatefulWidget {
  const RecipeDetailPage(
      {Key? key,
      required this.title,
      required this.color,
      required this.imageUrl})
      : super(key: key);

  final String title;
  final Color color;
  final String imageUrl;

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        RecipeCard(
          color: widget.color,
          title: widget.title,
          imageUrl: widget.imageUrl,
        )
      ],
    )));
  }
}

class RecipeCard extends StatelessWidget {
  const RecipeCard(
      {Key? key,
      required this.color,
      required this.title,
      required this.imageUrl})
      : super(key: key);

  final Color color;
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,

      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      child: Column(
        children: [
          CustomAppBar(),
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 10.0),
                child: ClipOval(
                  child: Image.network(
                    imageUrl,
                    width: 200,
                    height: 200,
                    fit: BoxFit.none,
                    scale: 4.75,
                  ),
                ),
              ),
            ],
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
      padding: const EdgeInsets.all(20.0),
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
