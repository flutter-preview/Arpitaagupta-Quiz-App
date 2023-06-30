//import the material package
import 'package:flutter/material.dart';

//Creating the HomeScreen widget
//Stateful Widget is used because it is going to be our parent widget
//and all the functions and variables will be in this widget, so we will need to change the state of our widget
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
    );
  }
}

//import this file to main.dart file
