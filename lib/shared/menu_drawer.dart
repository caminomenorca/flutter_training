import 'package:flutter/material.dart';
import 'package:flutter_training/screens/bmi_screen.dart';
import 'package:flutter_training/screens/intro_screen.dart';
import 'package:flutter_training/screens/session_screen.dart';
import 'package:flutter_training/screens/weather_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
            children: buildMenuItems(context)));
  }

  List<Widget> buildMenuItems(
      BuildContext context) {
    final List<String> menuTitles = [
      'Home',
      'BMI Calculator',
      'Weather',
      'Training'
    ];

    List<Widget> menuItems = [];

    menuItems.add(const DrawerHeader(
      decoration:
          BoxDecoration(color: Colors.amber),
      child: Text('Super TUFF HEADER',
          style: TextStyle(
              fontSize: 28, color: Colors.white)),
    ));
    for (var element in menuTitles) {
      Widget screen = Container();
      menuItems.add(ListTile(
        title: Text(element,
            style: const TextStyle(fontSize: 18)),
        onTap: () {
          switch (element) {
            case 'Home':
              screen = const IntroScreen();
              break;
            case 'BMI Calculator':
              screen = const BmiScreen();
              break;
            case 'Weather':
              screen = const WeatherScreen();
              break;
              case 'Training':
              screen = const SessionsScreen();
              break;

          }
          Navigator.of(context).pop();
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: ((context) =>
                      screen)));
        },
      ));
      continue;
    }
    return menuItems;
  }
}
