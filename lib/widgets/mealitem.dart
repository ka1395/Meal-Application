import 'package:flutter/material.dart';
import 'package:test2/models/meal.dart';
import 'package:test2/screens/meal_detil_screen.dart';

class Mealiteam extends StatelessWidget {
  final String imageurl;
  final String id;
  final String tital;
  final int duration;
  final Complexity complexity;
  final Affordability affordabillity;
  
  String get Complexitytext {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      default:
        return 'unknowen';
        break;
    }
  }

  String get Affordabillitytext {
    switch (affordabillity) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      default:
        return 'unknowen';
        break;
    }
  }

    Mealiteam(
      {required this.imageurl,
      required this.tital,
      required this.id,
      required this.duration,
      required this.complexity,
      required this.affordabillity
      });

  void getmeal(ctx) {
    Navigator.pushNamed(ctx, MealDetilscreen.routname,
        arguments: {'id': this.id}).then((value) {
      if (value != null) {
      //   deletfunction(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => getmeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(7.5),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    child: Image.network(this.imageurl),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )),
                Positioned(
                    bottom: 20,
                    right: 5,
                    child: Container(
                      width: 300,
                      color: Colors.black54,
                      child: Text(
                        tital,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 9,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.access_alarms),
                    SizedBox(
                      height: 6,
                    ),
                    Text("$duration min")
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.work),
                    SizedBox(
                      height: 6,
                    ),
                    Text("$Complexitytext")
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money_sharp),
                    SizedBox(
                      height: 6,
                    ),
                    Text("$Affordabillitytext")
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 9,
            ),
          ],
        ),
      ),
    );
  }
}
