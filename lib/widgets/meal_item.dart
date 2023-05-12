import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.title,
    @required this.imageUrl,
    @required this.affordability,
    @required this.complexity,
    @required this.duration,
  });

// ! THIS IS HOW WE USE ENUM FOR PRINTING 
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectMeal() {}
//! FULL OF DIFFERENT TYPES OF WIDGET 
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(//! THIS IS TYPE OF CONTAINER WITH SOME SPECIAL FEATURES
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(//! USE OF STACK 
              children: <Widget>[
                ClipRRect(//! THIS IS USED TO FORCED GIVING THE RADIUS TO THE ANY COMPONENT HERE IT IS IMAGE
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(//! POSITIONED CAN ONLY BE USED IN STACK WHICH CAN BE USED TO POSITION THE TEXT OR ANY THING 
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(children: <Widget>[
                    Icon(Icons.schedule,),
                    SizedBox(width: 6,),
                    Text('$duration min'),//! THIS DOLLAR SIGN IS USED TO SHOW THE TEST WITH THE PARAMETER WHICH WE ARE GETTING FROM DYNAMIC
                  ],),
                  Row(children: <Widget>[
                    Icon(Icons.work,),
                    SizedBox(width: 6,),
                    Text(complexityText),
                  ],),
                    Row(children: <Widget>[
                    Icon(Icons.attach_money,),
                    SizedBox(width: 6,),
                    Text(affordabilityText),
                  ],),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
