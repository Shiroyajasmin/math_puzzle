import 'package:flutter/material.dart';
import 'package:math_puzzle/main.dart';
import 'package:math_puzzle/second.dart';

class third extends StatefulWidget {

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  List clr = [
    Colors.white24,
    Colors.white24,
    Colors.white24,
  ];
  int curt_ind = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("images/background.jpg"),
        )),
        child: Column(
          children: [
            Expanded(
                child: Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              //color: Colors.black,
              child: Text(
                "COMPLIETED",
                style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 22,
                    fontStyle: FontStyle.italic),
              ),
            )),
            Expanded(
                flex: 4,
                child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    //     color: Colors.red,
                    child: Image(
                      image: AssetImage("images/trophy.png"),
                    ))),
            Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  // color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell( onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return second();
                        },));
                      },
                        child: Container(
                          //color: Colors.yellow,
                          height: 40,
                          width: 150,
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(6),
                          child: Text(
                            "CONTINUE",
                            style: TextStyle(
                              fontSize: 23,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(colors: [
                              Colors.blueGrey,
                              Colors.white,
                              Colors.blueGrey,
                              Colors.blueGrey
                            ]),
                          ),
                        ),
                      ),
                      InkWell( onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return puzzle(0);
                        },));
                        setState(() {

                        });
                      },
                        child: Container(
                          height: 40,
                          width: 150,
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(6),
                          child: Text(
                            "MAIN MENU",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(colors: [
                              Colors.blueGrey,
                              Colors.white,
                              Colors.blueGrey,
                              Colors.blueGrey
                            ]),
                          ),
                        ),
                      ),
                      Container(
                        //   color: Colors.yellow,
                        height: 40,
                        width: 150,
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(6),
                        child: Text(
                          "BUY PRO",
                          style: TextStyle(fontSize: 23),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(colors: [
                            Colors.blueGrey,
                            Colors.white,
                            Colors.blueGrey,
                            Colors.blueGrey
                          ]),
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                //  color: Colors.yellow,
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        height: 30,
                        alignment: Alignment.center,
                    //    color: Colors.white,
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "SHARE THIS PUZZLE",
                          style: TextStyle(fontSize: 25,
                          fontStyle: FontStyle.italic,
                          color: Colors.indigo),
                        ),
                      ),
                      // Container(
                      //   margin:EdgeInsets.only(top: 20),
                      //   height:45,width:50,
                      //   child: GFButton(
                      //     onPressed: (){},
                      //     text: "",
                      //     icon: Icon(Icons.share,size:26,),color:Colors.grey,
                      //   ),
                      // ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    ));
  }
}
