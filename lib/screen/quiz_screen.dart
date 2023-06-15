
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:quizee/screen/home.dart';
import 'package:quizee/screen/result.dart';

class QuizScreen extends StatefulWidget {

  var quiz;

  QuizScreen( {Key? mykey ,required this.quiz}) : super (key: mykey);


  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {


  bool isOptionA = false;
  bool isOptionB = false;
  bool isOptionC = false;
  bool isOptionD = false;
  double counter = 0.2 ;
  int scoreCounter = 0;
  bool isButtonDisabled = true;
  Color finish = Colors.white12;
  int ques_no = 0;
  late String value = "1";
  String _continue = "Continue";
  bool last = false;
  int a = 0;
  List rand = [0,1,2,3,4];
  bool shuffle = true;







  List question  = [
    {
      '0' : 'Who developed the Flutter Framework and continues to maintain it today?', '1' : 'Which programming language is used to build Flutter applications?', '2' : 'What is the key configuration file used when building a Flutter project?', '3' : 'Which component allows us to specify the distance between widgets on the screen?', '4' : 'Which release mode will not contain any debugging data when run?',
    } ,
    {
      '0' : 'Which of the following is a characteristic of Dart programming language?', '1' : 'What is Dart?', '2' : 'Which of the following is not a feature of Dart?', '3' : 'The _______ function is a predefined method in Dart.', '4' : 'Dart is an Object-Oriented language.',
    },
    {
      '0' : 'Number of primitive data types in Java are?', '1' : 'Arrays in java are-', '2' : 'Which one of the following is not a Java feature?', '3' : 'Which of these cannot be used for a variable name in Java?', '4' : ' Which of the following is not an OOPS concept in Java?',
    },{
      '0' : 'Which of the following is the correct extension of the Python file?', '1' : ' All keywords in Python are in _________', '2' : ' Which of the following is used to define a block of code in Python language?', '3' : 'Which keyword is used for function in Python language?', '4' : 'Which of the following functions is a built-in function in python?',
    },{
      '0' : 'Which of the following user-defined header file extension used in c++? ', '1' : 'Which of the following is not a type of Constructor in C++?', '2' : 'Which of the following type is provided by C++ but not C?', '3' : 'Which of the following correctly declares an array in C++?', '4' : ' Which of the following is used to terminate the function declaration in C++?',
    },{
      '0' : 'HTML stands for -', '1' : 'The correct sequence of HTML tags for starting a webpage is -', '2' : 'Which of the following element is responsible for making the text bold in HTML?', '3' : 'Which of the following tag is used to insert a line-break in HTML?', '4' : 'HTML tags are enclosed in-',
    }
  ];



  List optionA = [
    {
      '0' :  'Facebook', '1' : 'Kotlin', '2' : 'pubspec.yaml', '3' : 'SafeArea', '4' : 'Profile',
  },
    {
      '0' :  'Statically typed', '1' : 'A programming language', '2' : ' Type inference', '3' : 'declare()', '4' : 'Yes',
    },{
      '0' :  '6', '1' : 'object Refrences', '2' : 'Object-oriented', '3' : ' identifier & keyword', '4' : 'Polymorphism',
    },{
      '0' :  '.python', '1' : 'Capitalized', '2' : 'Indentation', '3' : 'Function', '4' : 'factorial()',
    },{
      '0' :  'hg', '1' : 'Default constructor', '2' : 'double', '3' : 'array{10};', '4' : ';',
    },{
      '0' :  'HighText Machine Language', '1' : 'Head, Title, HTML, body', '2' : '<pre>', '3' : '<br>', '4' : '< and >',
    },
  ];

List optionB = [
  {
    '0' :  'Microsoft', '1' : 'Dart', '2' : 'pubspec.xml', '3' : 'SizedBox', '4' : 'Debug',
  },
  {
    '0' :  'Dynamically typed', '1' : 'A web development framework', '2' : 'Asynchronous programming', '3' : 'list()', '4' : 'No',
  },{
    '0' :  '7', '1' : 'object', '2' : 'Use of pointers', '3' : 'identifier', '4' : 'Inheritance',
  },{
    '0' :  '.pl', '1' : 'lower case', '2' : 'Key', '3' : 'def', '4' : 'print()',
  },{
    '0' :  'cpp', '1' : 'Parameterized constructor', '2' : 'float', '3' : 'array array[10];', '4' : ']',
  },{
    '0' :  'HyperText links Markup Language', '1' : 'HTML, Body, Title, Head', '2' : '<a>', '3' : '<a>', '4' : '# and #',
  },
];

List optionC = [
  {
    '0' :  'Google', '1' : 'Java', '2' : 'config.html', '3' : 'table', '4' : 'Release',
  },
  {
    '0' :  'Both (a) and (b)', '1' : ' A database management system', '2' : 'Garbage collection', '3' : 'main()', '4' : ' Can be yes or no',
  },{
    '0' :  '8', '1' : 'primitive datatype', '2' : 'Portable', '3' : 'keyword', '4' : 'Compilation',
  },{
    '0' :  '.py', '1' : 'UPPER CASE', '2' : 'Brackets', '3' : 'Fun', '4' : 'seed()',
  },{
    '0' :  'h', '1' : 'Copy constructor', '2' : 'int', '3' : ' int array;', '4' : ')',
  },{
    '0' :  'HyperText Markup Language', '1' : 'HTML, Head, Title, Body', '2' : '<b>', '3' : '<pre>', '4' : '{ and }',
  },


  ];

  List optionD = [
    {
      '0' :  'Oracle', '1' : 'Go', '2' : 'root.xml', '3' : 'AppBar', '4' : 'Test',
    },
    {
      '0' :  'None of the above', '1' : 'A hardware device', '2' : 'Block-level scope', '3' : 'return()', '4' : ' Can not say',
    },{
      '0' :  '9', '1' : 'none', '2' : 'Dynamic and Extensible', '3' : 'none of the mentioned', '4' : 'Encapsulation',
    },{
      '0' :  '.p', '1' : 'None of the mentioned', '2' : 'All of the mentioned', '3' : 'Define', '4' : 'sqrt()',
    },{
      '0' :  'hf', '1' : 'Friend constructor', '2' : 'bool', '3' : 'int array[10];', '4' : ':',
    },{
      '0' :  'None of these', '1' : 'HTML, Head, Title, Body', '2' : '<br>', '3' : '<b>', '4' : '! and ?',
    },


  ];


  List correctAnswers = [{
    '0' : 'C' , '1' : 'B' , '2' : 'A' , '3' : 'B' , '4' : 'C'
  },
    {
      '0' : 'C' , '1' : 'A' , '2' : 'D' , '3' : 'C' , '4' : 'A'
    },
    { '0' : 'C' , '1' : 'B' , '2' : 'B' , '3' : 'C' , '4' : 'C' } ,
    {
      '0' : 'C' , '1' : 'D' , '2' : 'A' , '3' : 'B' , '4' : 'B'
    },
    {
      '0': 'C' , '1': 'D' , '2' : 'D' , '3' : 'D' , '4' : 'A'
    },
    {
      '0': 'C' , '1' : 'D' , '2' : 'C', '3' : ' A' , '4' : 'A'
    }
    ];





  List givenAnswers = [];
  List randomCorrectAnswer = [];


  void update(){
    setState(() {
      if(counter != 1){
        counter = counter+0.2;
      }
      value = (counter * 5).toString()[0] ;
      if(ques_no != 4){
      ques_no = ques_no+1;}

      if(counter == 1){
        _continue = "Finish";
      }

      randomCorrectAnswer.add(correctAnswers[widget.quiz]['$a']);

      if(isOptionA){
        givenAnswers.add("A");
      }else if(isOptionB) {
        givenAnswers.add("B");
      }else if (isOptionC){
        givenAnswers.add("C");
      }else if (isOptionD){
        givenAnswers.add("D");
      }

      isOptionA = false;
      isOptionB = false;
      isOptionC = false;
      isOptionD = false;



      print("random correct answer");
      print(randomCorrectAnswer);

      print("given answer");

      print(givenAnswers);
      // print(score());
      // if(givenAnswers.length == randomCorrectAnswer.length){
      //   print(score());
      // }
    });
  }

  int score(){

    for(int i = 0; i< randomCorrectAnswer.length ; i++){
      if(randomCorrectAnswer[i] == givenAnswers[i]){
        scoreCounter = scoreCounter + 1;
      }
    }

    return scoreCounter;
  }






  @override
  Widget build(BuildContext context) {

    if(counter == 1){
      last = true;
    }
    setState(() {
      if( isOptionA || isOptionB || isOptionC || isOptionD){
        isButtonDisabled = false;
        finish = Colors.blue;
      }
    });
    if(shuffle){
      rand.shuffle();
      shuffle = false;
    }
    a = rand[ques_no];







    return Scaffold(


      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    const Card(
                      color: Colors.white,
                      shadowColor: Colors.black,
                      margin: EdgeInsets.only(left: 20),
                      elevation: 10,
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          Icon(Icons.auto_awesome , size: 30, color: Colors.blue,),
                          SizedBox(width: 10,),
                          Text("0" , style: TextStyle(fontSize: 30),),
                          SizedBox(width: 10,)
                        ],
                      ),
                    ),
                    SizedBox(width: 50,),
                    Text("Timer" , style: TextStyle(fontSize: 30),),

                   InkWell(
                     onTap: (){
                       showDialog(context: context, builder: (context){
                         return AlertDialog(
                           title:Text("Are you sure?"),
                           actions: [
                             TextButton(onPressed: (){
                               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home.navigate()));
                             }, child: Text("Yes")),
                             TextButton(onPressed: (){
                               Navigator.pop(context);
                             }, child: Text("No"))
                           ],
                         );
                       } );
                     },
                     child: Card(
                       margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/4.5),
                       elevation: 10,
                       child: Icon(Icons.cancel_outlined , size: 40,),
                     ),
                   )

                  ],
                ),
              ),
              SizedBox(height: 20,),

              Container(
                padding: EdgeInsets.only(left: 10 , right: 10),
                width: MediaQuery.of(context).size.width,
                height: 20,
                child: Row(
                  children: [
                      Expanded(child: LinearProgressIndicator(minHeight: 15 ,value:counter, color: Colors.blue,) ),
                    Text("    $value/5")
                  ],
                ),
              ),

              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Format: +4 " , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 16)),
                  Text("for correct answer, "  ,style: TextStyle(  fontSize: 16)),
                  Text("-1 " , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 16)),
                  Text("for incorrect" , style: TextStyle( fontSize: 16))
                ],
              ),

              SizedBox(height: 20,),

              Container(
                height: MediaQuery.of(context).size.height/1.45,
                width: MediaQuery.of(context).size.width,
                color: Colors.white ,
                child: Card(
                  color: Colors.white,
                  margin: EdgeInsets.all(10),
                  elevation: 3,
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Text( question[widget.quiz]['$a'] , softWrap: true, style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold),),
                          SizedBox(height: 15,),

                          InkWell(
                            onTap: (){
                              setState(() {
                                isOptionA = true;
                                isOptionB = false;
                                isOptionC = false;
                                isOptionD = false;
                              });


                              },
                            child: Container(height: 70,
                              child: Card(
                                color: (isOptionA == true) ? Colors.blue : Colors.white,
                                elevation: 3,
                                child: Row(
                                  children: [
                                    Card(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Icon(Mdi.alphaACircle , color: Colors.blue, size: 40,),
                                    ),
                                    SizedBox(width: 20,),
                                    Text(optionA[widget.quiz]['$a'] , style: TextStyle(fontSize: 16), softWrap: true,)
                                  ],
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 15,),

                          InkWell(onTap: (){
                            setState(() {
                              isOptionA = false;
                              isOptionB = true;
                              isOptionC = false;
                              isOptionD = false;
                            });
                          },
                            child: Container(height: 70,
                              child: Card(
                                color: (isOptionB == true) ? Colors.blue : Colors.white,
                                elevation: 3,
                                child: Row(
                                  children: [
                                    Card(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Icon(Mdi.alphaBCircle , color: Colors.blue, size: 40,),
                                    ),
                                    SizedBox(width: 20,),
                                    Text(optionB[widget.quiz]['$a'] , style: TextStyle(fontSize: 16), softWrap: true,)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          
                          SizedBox(height: 15,),

                          InkWell(
                            onTap: (){
                              setState(() {
                                isOptionA = false;
                                isOptionB = false;
                                isOptionC = true;
                                isOptionD = false;
                              });
                            },
                            child: Container(height: 70,
                              child: Card(
                                color: (isOptionC == true) ? Colors.blue : Colors.white,
                                elevation: 3,
                                child: Row(
                                  children: [
                                    Card(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Icon(Mdi.alphaCCircle , color: Colors.blue, size: 40,),
                                    ),
                                    SizedBox(width: 20,),
                                    Text(optionC[widget.quiz]['$a'] , style: TextStyle(fontSize: 16),softWrap: true,)
                                  ],
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 15,),

                          InkWell(
                            onTap: (){
                              setState(() {
                                isOptionA = false;
                                isOptionB = false;
                                isOptionC = false;
                                isOptionD = true;
                              });
                            },
                            child: Container(height: 70,
                              child: Card(
                                color: (isOptionD == true) ? Colors.blue : Colors.white,
                                elevation: 3,
                                child: Row(
                                  children: [
                                    Card(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Icon(Mdi.alphaDCircle , color: Colors.blue, size: 40,),
                                    ),
                                    SizedBox(width: 20,),
                                    Text(optionD[widget.quiz]['$a'] , style: TextStyle(fontSize: 16),softWrap: true,)
                                  ],
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 70,),


                              Container(
                                height: 70,
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: finish
                                  ),
                                  onPressed: isButtonDisabled ? null : (){
                                    update();

                                    if(last){
                                      print(score());
                                    }

                                    if(last){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Result(score: scoreCounter , whichQuiz: widget.quiz,)));
                                    }

                                    finish = Colors.black12;
                                    isButtonDisabled = true;

                                  },
                                  child: Text(_continue , style: TextStyle(fontSize: 30 , color: Colors.white), ),

                                ),
                              )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),


    );
  }
}
