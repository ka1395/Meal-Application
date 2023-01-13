import 'package:flutter/material.dart';
import 'package:test2/widgets/MainDrawer.dart';

class filters extends StatefulWidget {
  static const routname = '/filters';
  var setfilters;
  Map<String, bool> _filters = {
    'Gluten': false,
    'Lactose': false,
    'Vegetarian': false,
    'Vegan': false,
  };

  filters(this.setfilters, this._filters);

  @override
  State<filters> createState() => _filtersState();
}

class _filtersState extends State<filters> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;

  @override
  void initState() {
    isGlutenFree = widget._filters['Gluten'] as bool;
     isLactoseFree = widget._filters['Lactose'] as bool;
      isVegan = widget._filters['Vegan'] as bool;
       isVegetarian = widget._filters['Vegetarian'] as bool;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("filters"),
        actions: [
          IconButton(
              onPressed: () {
                Map<String, bool> _Setfilters = {
                      'Gluten': isGlutenFree,
                      'Lactose': isLactoseFree,
                      'Vegetarian': isVegetarian,
                      'Vegan': isVegan,
                    };
                widget.setfilters(_Setfilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            "Adjust your meal selection",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            SwitchListTile(
                activeColor: Colors.red,
                title: Text("Gluten Free"),
                value: isGlutenFree,
                subtitle: Text("only include Gluten Free meal."),
                onChanged: (val) {
                  setState(() {
                    isGlutenFree = val;
                  });
                }),
            SwitchListTile(
                activeColor: Colors.red,
                title: Text("Lactose Free"),
                value: isLactoseFree,
                subtitle: Text("only include Lactose Free meal."),
                onChanged: (val) {
                  setState(() {
                    isLactoseFree = val;
                  });
                }),
            SwitchListTile(
                activeColor: Colors.red,
                title: Text("Vegetarian"),
                value: isVegetarian,
                subtitle: Text("only include Vegetarian meal."),
                onChanged: (val) {
                  setState(() {
                    isVegetarian = val;
                  });
                }),
            SwitchListTile(
                activeColor: Colors.red,
                title: Text("Vegan"),
                value: isVegan,
                subtitle: Text("only include isVegan meal."),
                onChanged: (val) {
                  setState(() {
                    isVegan = val;
                  });
                }),
          ],
        ))
      ]),
      drawer: MainDrawer(),
    );
  }
}
