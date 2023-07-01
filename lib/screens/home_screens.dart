//import the material package
import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/question_models.dart'; //question model
import '../widgets/questions_widgets.dart'; //the question widget
import '../widgets/next_button.dart';
import '../widgets/option_card.dart';

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
    Question(
      id: '15',
      title: 'Who discovered gravity ?',
      options: {
        'Einstein': false,
        'E. Goldstein': false,
        'Chadwick': false,
        'Newton': true
      },
    ),
    Question(
      id: '16',
      title: 'Who climbed Mt. Everest first ?',
      options: {
        'Tenzing Norway': false,
        'Edmund Hillary': false,
        'All of the above': true,
        'None of the above': false
      },
    ),
    Question(
      id: '17',
      title: 'Where is river Thames located ?',
      options: {
        'Hong Kong': false,
        'London': true,
        'Paris': false,
        'Switzerland': false
      },
    ),
    Question(
      id: '18',
      title: 'Who is first Indian Woman to go in space ?',
      options: {
        'Kalpana Chawla': true,
        'Priyanka Srisvastav': false,
        'Yogita Shah': false,
        'Swati Mohan': false
      },
    ),
    Question(
      id: '19',
      title: 'Which is the largest desert in India ?',
      options: {
        'Indus Valley Desert': false,
        'Jaisalmer': false,
        'Thar': true,
        'Bikaner': false
      },
    ),
  ];

  //creating an index to loop through questions
  int index = 0;

  //create a boolean value to check if the user has clicked
  bool isPressed = false;

  //create a function to display next question
  void nextQuestion() {
    if (index == _questions.length - 1) {
      return;
    } else {
      setState(() {
        index++; //when the index change to 1. rebuild the app
        isPressed = false;
      });
    }
  }

  //create a function for changing color
  void changeColor() {
    setState(() {
      isPressed = true;
    });
  }

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
            //add some space,
            const SizedBox(height: 25.0),
            for (int i = 0; i < _questions[index].options.length; i++)
              OptionCard(
                option: _questions[index].options.keys.toList()[i],
                color: isPressed
                    ? _questions[index].options.values.toList()[i] == true
                        ? correct
                        : incorrect
                    : neutral,
                onTap: changeColor,
              ),
          ],
        ),
      ),

      //use the floating action button,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextButton(
          nextQuestion: nextQuestion, //the above function
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

//import this file to main.dart file
