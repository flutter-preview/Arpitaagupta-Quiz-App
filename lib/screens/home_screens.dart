//import the material package
import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/question_models.dart'; //question model
import '../widgets/questions_widgets.dart'; //the question widget

//Creating the HomeScreen widget
//Stateful Widget is used because it is going to be our parent widget
//and all the functions and variables will be in this widget, so we will need to change the state of our widget
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Question> _questions = [
    Question(
      id: '10',
      title: 'Which is the largest planet in solar system ?',
      options: {
        'Mars': false,
        'Earth': false,
        'Jupiter': true,
        'Uranus': false
      },
    ),
    Question(
      id: '11',
      title: 'In which ocean "Bermuda Triangle" region is located ?',
      options: {
        'Atlantic': true,
        'Indian': false,
        'Pacific': false,
        'Arctic': false
      },
    ),
    Question(
      id: '12',
      title: 'Which country is also known as "Land of Rising Sun"?',
      options: {
        'China': false,
        'New Zealand': false,
        'Fiji': false,
        'Japan': true
      },
    ),
    Question(
      id: '13',
      title: 'Which is the biggest Island in the world ?',
      options: {
        'Borneo': false,
        'Finland': false,
        'Sumatra': false,
        'Greenland': true
      },
    ),
    Question(
      id: '14',
      title: 'Which is the smallest ocean in the world',
      options: {
        'Atlantic': false,
        'Arctic': true,
        'Pacific': false,
        'Indian': false
      },
    ),
  ];

  //creating an index to loop through questions
  int index = 0;
  @override
  Widget build(BuildContext context) {
    //chsnge the background

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('Quiz App'),
        backgroundColor: skyBlueColor,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            //adding QuestionsWidget here,
            QuestionWidget(
              indexAction: index, //currently at 0.
              question: _questions[index]
                  .title, //means the first question in the list
              totalQuestions: _questions.length, //total length of the list
            ),
            const Divider(
              color: neutral,
            ),
          ],
        ),
      ),
    );
  }
}

//import this file to main.dart file
