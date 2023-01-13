import 'package:flutter/material.dart';
import 'package:test2/1.1%20dummy_data.dart';
import 'package:test2/models/meal.dart';
import 'package:test2/screens/category_meals_screen.dart';
import 'package:test2/screens/category_screen.dart';
import 'package:test2/screens/filters_screen.dart';
import 'package:test2/screens/meal_detil_screen.dart';
import './screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'Gluten': false,
    'Lactose': false,
    'Vegetarian': false,
    'Vegan': false,
  };
  List<Meal> _favorites = [];
  List<Meal> _avaibilityMeal = DUMMY_MEALS;
  void setfilters(Map<String, bool> _filter) {
    setState(() {
      this._filters = _filter;

      _avaibilityMeal = DUMMY_MEALS.where((val) {
        if (_filters['Gluten'] == true && !val.isGlutenFree) {
          return false;
        }
        if (_filters['Lactose'] == true && !val.isLactoseFree) {
          return false;
        }
        if (_filters['Vegetarian'] == true && !val.isVegetarian) {
          return false;
        }
        if (_filters['Vegan'] == true && !val.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _togglefavorites(String id) {
    final exitingindex = _favorites.indexWhere((val) => val.id == id);

    if (exitingindex >= 0) {
      setState(() {
        _favorites.removeAt(exitingindex);
      });
    }
    else{
      setState(() {
        _favorites.add(DUMMY_MEALS.firstWhere((val) => val.id == id));
      });
    }
  }

  bool ismealfavorites(String id) {
    return _favorites.any((val) => val.id == id);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.grey,
          canvasColor: Color.fromARGB(236, 214, 211, 212),
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Colors.white24),
              bodyText2: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ))),
      debugShowCheckedModeBanner: false,
      title: "Meal App",
      // home: MyHomePage(),
      home: Tabs_scrren(_favorites),
      routes: {
        Tabs_scrren.routname: (ctx) => Tabs_scrren(_favorites),
        MealDetilscreen.routname: (context) => MealDetilscreen(_togglefavorites,ismealfavorites),
        CategoryMealsScreen.routname: (context) =>
            CategoryMealsScreen(_avaibilityMeal),
        filters.routname: (context) => filters(setfilters, _filters),
      },
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageWithState createState() => MyHomePageWithState();
}

class MyHomePageWithState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal App"),
      ),
      body: CategoryScreen(),
    );
  }
}
