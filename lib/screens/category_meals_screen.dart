import 'package:flutter/material.dart';
import 'package:test2/models/meal.dart';
import 'package:test2/widgets/mealitem.dart';
import '../1.1 dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routname = '/categorymeals';
  List<Meal> avaibilityMeal;
  CategoryMealsScreen( this.avaibilityMeal);

  @override
  State<CategoryMealsScreen> createState() => CategoryMealsScreen_State();
}

class CategoryMealsScreen_State extends State<CategoryMealsScreen> {
  var title;

  // ignore: non_constant_identifier_names
  late List<Meal> Categorymeal;
  @override
  void didChangeDependencies() {
    var routargument = ModalRoute.of(context)?.settings.arguments as Map;
    Categorymeal = widget.avaibilityMeal.where((element) {
      return element.categories.contains(routargument['id']);
    }).toList() ;
    title = routargument['title'];
    var id = routargument['id'];
    super.didChangeDependencies();
  }

  void _deletfunction(mealid) {
    setState(() {
      Categorymeal.removeWhere((id) => id.id == mealid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            return Mealiteam(
              id: Categorymeal[index].id,
              imageurl: Categorymeal[index].imageUrl,
              tital: Categorymeal[index].title,
              duration: Categorymeal[index].duration,
              complexity: Categorymeal[index].complexity,
              affordabillity: Categorymeal[index].affordability
            );
          },
          itemCount: Categorymeal.length),
    );
  }
}
