import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test2/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void GoscreenCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryMealsScreen.routname,
    arguments:{
      'id':this.id,
      "title":this.title
    } );
  }

  @override
  Widget build(BuildContext context) {

    return InkWell(
      splashColor: Theme.of(context).primaryColor ,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(this.title),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                colors: [this.color.withOpacity(0.2), this.color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
      ),
      onTap: () => GoscreenCategory(context),
      hoverColor: Colors.teal,
    );
  }
}
