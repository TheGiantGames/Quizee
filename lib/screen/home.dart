import 'package:flutter/material.dart';
import 'package:quizee/screen/quiz_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {

  var whichQuiz;
  var score;

 Home({Key? key , required this.whichQuiz , required this.score}) : super(key: key);
 Home.navigate({super.key});

  @override
  State<Home> createState() => _HomeState();
}




String flutter = "" , dart = "" ,java = "" ,python = "", c = "" , html = "";

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();

    get();

    setState(() {

    });


  }

  Future<void> get() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    flutter = sp.getString("flutter") ?? "0";
    dart = sp.getString("dart")?? "0";
    java = sp.getString("java") ?? "0";
    python = sp.getString("python") ?? "0";
    c = sp.getString("c") ?? "0";
    html = sp.getString("html") ?? "0";
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {




//get();
  print(flutter);
  print(dart);







    return Scaffold(

      body: Container(
        padding: EdgeInsets.only(top: 50),
        color: Colors.black38,
        child: Column(
          children: [
            Container(
              padding:EdgeInsets.symmetric(horizontal: 20) ,
              child: Row(
               children: [
                 Container(
                   decoration: BoxDecoration(
                       color: Color(0xffdfc03a),
                     borderRadius:  BorderRadius.all(Radius.circular(30))
                   ),
                     child: Text("  Quizzes  " ,style: TextStyle(fontSize: 50 ,fontWeight: FontWeight.bold),)),
                 SizedBox(width: MediaQuery.of(context).size.width/6,),
                 InkWell(onTap: (){
                   showDialog(context: context, builder: (context){
                     return Container(
                       child: AlertDialog(
                         title: Container(
                           alignment: Alignment.center,
                             child: Column(
                               children: [
                                 Text("ScoreBoard" ,style: TextStyle(fontSize: 30  , fontWeight: FontWeight.bold),),
                                 Text("(Store last score of quiz played using shared Prefrences)" , style: TextStyle(fontSize: 10), ),
                                 SizedBox(height: 20,),
                                 Table(
                                   border: TableBorder.all(),
                                   children:  [
                                     TableRow(
                                       children:[
                                         Text("Quiz" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20 ,) , textAlign: TextAlign.center,),
                                         Text("Last\nScore" , style: TextStyle(fontWeight: FontWeight.bold  , fontSize: 20) , textAlign: TextAlign.center,),
                                       ]
                                     ),
                                     TableRow(
                                         children:[
                                           Text("Flutter" , style: TextStyle( fontSize: 20 ,) , textAlign: TextAlign.center,),
                                           Text( flutter , style: TextStyle( fontSize: 20) , textAlign: TextAlign.center,),
                                         ]
                                     ),
                                     TableRow(
                                         children:[
                                           Text("Dart" , style: TextStyle( fontSize: 20 ,) , textAlign: TextAlign.center,),
                                           Text(dart , style: TextStyle(fontSize: 20) , textAlign: TextAlign.center,),
                                         ]
                                     ),
                                     TableRow(
                                         children:[
                                           Text("Java" , style: TextStyle( fontSize: 20 ,) , textAlign: TextAlign.center,),
                                           Text(java , style: TextStyle(fontSize: 20) , textAlign: TextAlign.center,),
                                         ]
                                     ),
                                     TableRow(
                                         children:[
                                           Text("Python" , style: TextStyle( fontSize: 20 ,) , textAlign: TextAlign.center,),
                                           Text(python , style: TextStyle( fontSize: 20) , textAlign: TextAlign.center,),
                                         ]
                                     ),
                                     TableRow(
                                         children:[
                                           Text("C++" , style: TextStyle( fontSize: 20 ,) , textAlign: TextAlign.center,),
                                           Text(c , style: TextStyle( fontSize: 20) , textAlign: TextAlign.center,),
                                         ]
                                     ),
                                     TableRow(
                                         children:[
                                           Text("HTML" , style: TextStyle( fontSize: 20 ,) , textAlign: TextAlign.center,),
                                           Text(html , style: TextStyle( fontSize: 20) , textAlign: TextAlign.center,),
                                         ]
                                     ),
                                   ],
                                 )
                               ],
                             ),
                             //child: Text("ScoreBoard" ,style: TextStyle(fontSize: 30  , fontWeight: FontWeight.bold),)
                         ),


                       ),
                     );
                   });
                 },
                     child: Icon(Icons.info_rounded , size: 40,)),
               ],
             ),
             //child: Text("  Quizzes  " ,style: TextStyle(fontSize: 50 ,fontWeight: FontWeight.bold),),
            ),

            Container(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Flexible(flex:1,
                      fit: FlexFit.tight,
                      child: Stack(
                        children: [
                          InkWell(
                            child: Card(elevation: 8,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                child: Image.asset("assets/images/flutter.png")
                            ),
                            onTap: (){
                              showDialog(context: context, builder: (context) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height/4,
                                    child: AlertDialog(scrollable: true,
                                      title: Container(
                                        alignment: Alignment.topCenter,
                                          child: Text("Flutter Quiz")),
                                      content: const Column(
                                        children: [
                                          Text("This Flutter Quiz is designed to check your knowledge about flutter.\n"),
                                          Align(alignment: Alignment.topLeft,child:
                                          Text("Instructions:-\n" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),),
                                          Text("1. There will be the timer of 30 seconds for each question."),
                                          Text("2. +4 marks will be awarded for correct answer."),
                                          Text("3. -1 marks will be awarded for wrong answer."),
                                          Text("4. All Questions are compulsory. If no option selected it will be considered as wrong. "),
                                          Text("!!Best Of Luck!!" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),)
                                        ],
                                      ),
                                      actions: [
                                        TextButton(onPressed: (){
                                          Navigator.pop(context);
                                        }, child: Text("Cancel")),
                                        TextButton(onPressed: (){
                                          Navigator.push(context ,  MaterialPageRoute(builder: (context) => QuizScreen(quiz: 0,)));
                                        }, child: Text("Start")),

                                      ],

                                    ),
                                  );
                              });
                            },
                          ),
                        ],
                      )),
                  Flexible(flex:1,
                      fit: FlexFit.tight,
                      child: Stack(
                        children: [
                          InkWell(
                            child: Card(elevation: 8,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                child: Image.asset("assets/images/dart.png")
                            ),
                            onTap: (){
                              showDialog(context: context, builder: (context) {
                                return Container(
                                  height: MediaQuery.of(context).size.height/4,
                                  child: AlertDialog(scrollable: true,
                                    title: Container(
                                        alignment: Alignment.topCenter,
                                        child: Text("Dart Quiz")),
                                    content: const Column(
                                      children: [
                                        Text("This Dart Quiz is designed to check your knowledge about Dart.\n"),
                                        Align(alignment: Alignment.topLeft,child:
                                        Text("Instructions:-\n" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),),
                                        Text("1. There will be the timer of 30 seconds for each question."),
                                        Text("2. +4 marks will be awarded for correct answer."),
                                        Text("3. -1 marks will be awarded for wrong answer."),
                                        Text("4. All Questions are compulsory. If no option selected it will be considered as wrong. "),
                                        Text("!!Best Of Luck!!" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),)
                                      ],
                                    ),
                                    actions: [
                                      TextButton(onPressed: (){
                                        Navigator.pop(context);
                                      }, child: Text("Cancel")),
                                      TextButton(onPressed: (){
                                        Navigator.push(context ,  MaterialPageRoute(builder: (context) => QuizScreen(quiz: 1,)));
                                      }, child: Text("Start")),

                                    ],

                                  ),
                                );
                              });
                            },
                          ),
                        ],
                      )),
                ],
              ),
            ),


            Container(
              padding: EdgeInsets.only(top: 3),
              child: Row(
                children: [
                  Flexible(flex:1,
                      fit: FlexFit.tight,
                      child: Stack(
                        children: [
                          InkWell(
                            child: Card(elevation: 8,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                child: Image.asset("assets/images/java.png")
                            ),
                            onTap: (){
                              showDialog(context: context, builder: (context) {
                                return Container(
                                  height: MediaQuery.of(context).size.height/4,
                                  child: AlertDialog(scrollable: true,
                                    title: Container(
                                        alignment: Alignment.topCenter,
                                        child: Text("JAVA Quiz")),
                                    content: const Column(
                                      children: [
                                        Text("This Java Quiz is designed to check your knowledge about Java.\n"),
                                        Align(alignment: Alignment.topLeft,child:
                                        Text("Instructions:-\n" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),),
                                        Text("1. There will be the timer of 30 seconds for each question."),
                                        Text("2. +4 marks will be awarded for correct answer."),
                                        Text("3. -1 marks will be awarded for wrong answer."),
                                        Text("4. All Questions are compulsory. If no option selected it will be considered as wrong. "),
                                        Text("!!Best Of Luck!!" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),)
                                      ],
                                    ),
                                    actions: [
                                      TextButton(onPressed: (){
                                        Navigator.pop(context);
                                      }, child: Text("Cancel")),
                                      TextButton(onPressed: (){
                                        Navigator.push(context ,  MaterialPageRoute(builder: (context) => QuizScreen(quiz: 2,)));
                                      }, child: Text("Start")),

                                    ],

                                  ),
                                );
                              });
                            },
                          ),
                        ],
                      )),
                  Flexible(flex:1,
                      fit: FlexFit.tight,
                      child: Stack(
                        children: [
                          InkWell(
                            child: Card(elevation: 8,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                child: Image.asset("assets/images/python.png")
                            ),
                            onTap: (){
                              showDialog(context: context, builder: (context) {
                                return Container(
                                  height: MediaQuery.of(context).size.height/4,
                                  child: AlertDialog(scrollable: true,
                                    title: Container(
                                        alignment: Alignment.topCenter,
                                        child: Text("PYTHON Quiz")),
                                    content: const Column(
                                      children: [
                                        Text("This python Quiz is designed to check your knowledge about python.\n"),
                                        Align(alignment: Alignment.topLeft,child:
                                        Text("Instructions:-\n" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),),
                                        Text("1. There will be the timer of 30 seconds for each question."),
                                        Text("2. +4 marks will be awarded for correct answer."),
                                        Text("3. -1 marks will be awarded for wrong answer."),
                                        Text("4. All Questions are compulsory. If no option selected it will be considered as wrong. "),
                                        Text("!!Best Of Luck!!" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),)
                                      ],
                                    ),
                                    actions: [
                                      TextButton(onPressed: (){
                                        Navigator.pop(context);
                                      }, child: Text("Cancel")),
                                      TextButton(onPressed: (){
                                        Navigator.push(context ,  MaterialPageRoute(builder: (context) => QuizScreen(quiz: 3,)));
                                      }, child: Text("Start")),

                                    ],

                                  ),
                                );
                              });
                            },
                          ),
                        ],
                      )),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 3),
              child: Row(
                children: [
                  Flexible(flex:1,
                      fit: FlexFit.tight,
                      child: Stack(
                        children: [
                          InkWell(
                            child: Card(elevation: 8,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                child: Image.asset("assets/images/c.png")
                            ),
                            onTap: (){
                              showDialog(context: context, builder: (context) {
                                return Container(
                                  height: MediaQuery.of(context).size.height/4,
                                  child: AlertDialog(scrollable: true,
                                    title: Container(
                                        alignment: Alignment.topCenter,
                                        child: Text("C++ Quiz")),
                                    content: const Column(
                                      children: [
                                        Text("This C++ Quiz is designed to check your knowledge about C++.\n"),
                                        Align(alignment: Alignment.topLeft,child:
                                        Text("Instructions:-\n" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),),
                                        Text("1. There will be the timer of 30 seconds for each question."),
                                        Text("2. +4 marks will be awarded for correct answer."),
                                        Text("3. -1 marks will be awarded for wrong answer."),
                                        Text("4. All Questions are compulsory. If no option selected it will be considered as wrong. "),
                                        Text("!!Best Of Luck!!" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),)
                                      ],
                                    ),
                                    actions: [
                                      TextButton(onPressed: (){
                                        Navigator.pop(context);
                                      }, child: Text("Cancel")),
                                      TextButton(onPressed: (){
                                        Navigator.push(context ,  MaterialPageRoute(builder: (context) => QuizScreen(quiz: 4,)));
                                      }, child: Text("Start")),

                                    ],

                                  ),
                                );
                              });
                            },
                          ),
                        ],
                      )),
                  Flexible(flex:1,
                      fit: FlexFit.tight,
                      child: Stack(
                        children: [
                          InkWell(
                            child: Card(elevation: 8,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                child: Image.asset("assets/images/html.png")
                            ),
                            onTap: (){
                              showDialog(context: context, builder: (context) {
                                return Container(
                                  height: MediaQuery.of(context).size.height/4,
                                  child: AlertDialog(scrollable: true,
                                    title: Container(
                                        alignment: Alignment.topCenter,
                                        child: Text("HTML Quiz")),
                                    content: const Column(
                                      children: [
                                        Text("This HTML Quiz is designed to check your knowledge about HTML.\n"),
                                        Align(alignment: Alignment.topLeft,child:
                                        Text("Instructions:-\n" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),),
                                        Text("1. There will be the timer of 30 seconds for each question."),
                                        Text("2. +4 marks will be awarded for correct answer."),
                                        Text("3. -1 marks will be awarded for wrong answer."),
                                        Text("4. All Questions are compulsory. If no option selected it will be considered as wrong. "),
                                        Text("!!Best Of Luck!!" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),)
                                      ],
                                    ),
                                    actions: [
                                      TextButton(onPressed: (){
                                        Navigator.pop(context);
                                      }, child: Text("Cancel")),
                                      TextButton(onPressed: (){
                                        Navigator.push(context ,  MaterialPageRoute(builder: (context) => QuizScreen(quiz: 5,)));
                                      }, child: Text("Start")),

                                    ],

                                  ),
                                );
                              });
                            },
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


