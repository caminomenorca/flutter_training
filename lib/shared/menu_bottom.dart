import 'package:flutter/material.dart';

class MenuBottom extends StatelessWidget {
  const MenuBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.amber,
      selectedItemColor: Colors.pink,
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/');
            break;
          case 1:
            Navigator.pushNamed(context, "/bmi");
            break;
          case 2:
            Navigator.pushNamed(
                context, '/weather');
            break;
             case 3:
            Navigator.pushNamed(
                context, '/trainings');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.monitor_weight_outlined),
            label: 'BMI'),
        BottomNavigationBarItem(
            icon: Icon(Icons.sunny_snowing),
            label: 'Weather'),
        BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Weather')
      ],
    );
  }
}
