import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/mealitem.dart';

class favorites extends StatelessWidget {
  final List<Meal> _favorites;
  favorites(this._favorites);
  @override
  Widget build(BuildContext context) {
    if (_favorites.isEmpty) {
      return Center(
        child: Text("ther isn't any favorites"),
      );
    } else {
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return Mealiteam(
              id: _favorites[index].id,
              imageurl: _favorites[index].imageUrl,
              tital: _favorites[index].title,
              duration: _favorites[index].duration,
              complexity: _favorites[index].complexity,
              affordabillity: _favorites[index].affordability,
             
            );
          },
          itemCount: _favorites.length);
    }
  }
}
