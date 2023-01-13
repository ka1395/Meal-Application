import 'package:flutter/material.dart';
import 'package:test2/models/meal.dart';
import '../widgets/MainDrawer.dart';
import 'category_screen.dart';
import 'favorites_screen.dart';

class Tabs_scrren extends StatefulWidget {
  List<Meal> _favorites;
  static const routname = '/TabsScreen';

  Tabs_scrren(this._favorites);
  @override
  State<Tabs_scrren> createState() => _Tabs_scrrenState();
}

class _Tabs_scrrenState extends State<Tabs_scrren> {
  int selectpageindex = 0;
  void selectpage(int value) {
    setState(() {
      selectpageindex = value;
    });
  }

 late List<Map<String, Object>> _pages;

 @override
  void initState() {
    _pages= [
    {"page": CategoryScreen(), "title": "categories"},
    {"page": favorites(widget._favorites), "title": "favorites"}
  ];

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectpageindex]["title"] as String),
      ),
      drawer: MainDrawer(),
      body: _pages[selectpageindex]["page"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Theme.of(context).accentColor,
          selectedItemColor: Colors.black,
          currentIndex: selectpageindex,
          backgroundColor: Theme.of(context).primaryColor,
          onTap: selectpage,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "category"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "favorites")
          ]),
    );
  }
}
