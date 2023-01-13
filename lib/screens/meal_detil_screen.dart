import 'package:flutter/material.dart';
import 'package:test2/1.1%20dummy_data.dart';

class MealDetilscreen extends StatelessWidget {
  static const routname = '/mealdetils';
  final Function setfsvorites;
  final Function ismealfavorites;
  MealDetilscreen(this.setfsvorites,this.ismealfavorites) ;

  Widget titlesheet(String str, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Text(
        str,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget listsheet(Widget child) {
    return Container(
        width: 300,
        height: 200,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    var selectedmeal = ModalRoute.of(context)?.settings.arguments as Map;
    var meal = DUMMY_MEALS.firstWhere((val) => val.id == selectedmeal['id']);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            titlesheet("ingredients", context),
            listsheet(
              ListView.builder(
                  itemBuilder: ((context, index) {
                    return Card(
                      child: Text(
                        '${meal.ingredients[index]}',
                      ),
                    );
                  }),
                  itemCount: meal.ingredients.length),
            ),
            SizedBox(
              height: 7,
            ),
            titlesheet("steps", context),
            listsheet(
              ListView.builder(
                  itemBuilder: ((context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text(
                        '${meal.steps[index]}',
                      ),
                    );
                  }),
                  itemCount: meal.steps.length),
            ),
            SizedBox(
              height: 7,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setfsvorites(meal.id);
        },
        child: Icon(
          ismealfavorites(meal.id)?Icons.star :Icons.star_border,
        ),
      ),
    );
  }
}
