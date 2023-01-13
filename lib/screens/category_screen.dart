import 'package:flutter/material.dart';
import 'package:test2/1.1%20dummy_data.dart';
import 'package:test2/widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: GridView(
        padding: EdgeInsets.all(20),
        children: DUMMY_CATEGORIES.map((val) => CategoryItem(val.id, val.title, val.color)).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 30,
          childAspectRatio: 2/3,
          crossAxisSpacing: 70,
          mainAxisExtent: 100,
          
        ),
      ),
    );
  }
}
