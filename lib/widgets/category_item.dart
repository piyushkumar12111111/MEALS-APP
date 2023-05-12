import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);


//! NAMED NAVIGATION  WITH PASSING ARGUMENTS WITH NAMED NAVIGATION
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {//! HERE IS THE ARGUMENTS
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(//! NAMED NAVIGATION CALLING
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,//! THIS IS HOW WE DO DO THEME-DESIGN 
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
