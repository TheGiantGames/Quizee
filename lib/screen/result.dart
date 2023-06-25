import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:quizee/screen/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Result extends StatefulWidget {

  var score;
  var whichQuiz;

      Result({Key? mykey , required this.score ,required this.whichQuiz}) : super(key: mykey) ;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;


    String total = (widget.score *4 + (5-widget.score)*(-1)).toString();
    print(widget.score);
    print(widget.whichQuiz);

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Mdi.clipboardTextOutline , size: 100, color: Colors.blue,),
              Text("Results of Flutter Quiz" , style: TextStyle(fontSize: 25 ,fontWeight: FontWeight.bold ,color: Colors.blue),),
              SizedBox(height: 30,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black12,
                ),
                margin: EdgeInsets.symmetric(horizontal: 30),
                padding: EdgeInsets.all(6),


                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Padding(  padding: EdgeInsets.only(left: width/20 , right: width/30),
                      child: Icon(Icons.auto_awesome , size: 40, color: Colors.blue, )),
                      Text("Score Gained" , style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold),),
                      Spacer(),
                      Padding(
                        padding:  EdgeInsets.only(right: width/30),
                        child: Text(total, style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold),),
                      )
                    ],
                  ),

              ),
              SizedBox(height: 10,),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black12,
                ),
                margin: EdgeInsets.symmetric(horizontal: 30),
                padding: EdgeInsets.all(6),

                child: Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: width/20 , right: width/30),
                      child: Icon(Icons.check_circle , size: 40, color: Colors.blue,),
                    ),
                    Text("Correct Predictions" , style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold),),

                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: width/30),
                      child: Text(widget.score.toString(), style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold ), ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 100,),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  child: Text("OKAY" , style: TextStyle(fontSize: 25 ,fontWeight: FontWeight.bold , color: Colors.white),),
                  onPressed: ()  async {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Home(whichQuiz: widget.whichQuiz, score: total,)));



                    SharedPreferences data = await SharedPreferences.getInstance();


                   if(widget.whichQuiz == 0){
                     data.setString("flutter", total.toString());
                   }

                    if(widget.whichQuiz == 1){
                      data.setString("dart", total.toString());
                    }
                    if(widget.whichQuiz == 2){
                      data.setString("java", total.toString());
                    }
                    if(widget.whichQuiz == 3){
                      data.setString("python", total.toString());
                    }
                    if(widget.whichQuiz == 4){
                      data.setString("c", total.toString());
                    }
                    if(widget.whichQuiz == 5){
                      data.setString("html", total.toString());
                    }

                          setState(() {

                          });



    },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 5)
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
