import 'package:flutter/material.dart';
import 'package:flutter_training/shared/menu_drawer.dart';

import '../shared/menu_bottom.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Center(
                child: Text('Hey luv!'))),
        drawer: const MenuDrawer(),
        bottomNavigationBar: const MenuBottom(),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "ventilator.jpg"),
                    fit: BoxFit.cover)),
            child: Center(
                child: Container(
                    padding:
                        const EdgeInsets.all(12),
                    decoration:
                        const BoxDecoration(
                      color: Colors.white70,
                      borderRadius:
                          BorderRadius.all(
                              Radius.circular(
                                  35)),
                    ),
                    child: const Text(
                        "Maintenant \n ça marche peut être ?",
                        textAlign:
                            TextAlign.center,
                        style: TextStyle(
                            fontSize: 22,
                            shadows: [
                              Shadow(
                                offset: Offset(
                                    1.0, 1.0),
                                blurRadius: 2.10,
                                color: Colors.red,
                              )
                            ]))))));
  }
}
