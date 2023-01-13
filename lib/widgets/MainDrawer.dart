import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';
import '../screens/tabs_screen.dart';
import '../screens/category_meals_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget BuildLIstile(String str, IconData icon, VoidCallback fun) {
    return ListTile(
      onTap: fun,
      leading: Icon(icon),
      title: Text(
        str,
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
              height: 75,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColor.withOpacity(0.2),
              ])),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Welcom",
                style: TextStyle(
                  fontFamily: "Raleway",
                  fontSize: 30,
                ),
                textAlign: TextAlign.left,
              )),
          SizedBox(
            height: 20,
          ),
          BuildLIstile("Meal", Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed(Tabs_scrren.routname);
          }),
          BuildLIstile("filters", Icons.settings,
              () => Navigator.of(context).pushReplacementNamed(filters.routname)),
        ],
      ),
    );
  }
}
