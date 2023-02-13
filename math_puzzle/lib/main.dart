// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables, camel_case_types, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:math_puzzle/contd.dart';
import 'package:math_puzzle/puzl.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: myApp(),
  ));
}

class myApp extends StatefulWidget {
  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {

  bool t1 = false;
  SharedPreferences? pref;
  List ans = [ 10,20,30,40,50,60,70,80,90,100,];
  int crnt_lvl = 0;
  List level_status = [];
  int i = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shared_pref_fun();
    level_status = List.filled(ans.length, "no");
    for (int i = 0; i < crnt_lvl; i++) {
      level_status[i] = pref!.getString("level_status$i") ?? "no";
    }
  }
  shared_pref_fun() async {
    pref = await SharedPreferences.getInstance();
    crnt_lvl = pref!.getInt("levelNo") ?? 0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("myimages/background.jpg"),
                        fit: BoxFit.fill)),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 60),
                        child: Text("Math Puzzles",style: TextStyle( fontSize: 29,
                              color: Color(0xff000099).withOpacity(0.7),
                              fontFamily: "mathspzl2",fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 500, width: 500,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(image: DecorationImage(image:AssetImage("myimages/blackboard.png"),
                                    fit: BoxFit.fill)),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTapCancel: () {
                                    setState(() {
                                      t1 = false;
                                    });
                                  },
                                  onTapUp: (details) {
                                    setState(() {
                                      t1 = false;
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return contd(crnt_lvl, level_status);
                                        },
                                      ));
                                    });
                                  },
                                  onTapDown: (details) {
                                    setState(() {
                                      t1 = true;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 2,
                                            color: (t1 == true)
                                                ? Colors.white
                                                : Colors.black)),
                                    margin: EdgeInsets.only(top: 170),
                                    child: Text(
                                      "CONTINUE",style: TextStyle(
                                          color: Colors.white,fontSize: 25,fontFamily: "mathspzl"),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return puzl(crnt_lvl, level_status);
                                      },
                                    ));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 2,
                                        // color: (t1 == true ) ? Colors.white : Colors.black
                                      ),
                                    ),
                                    margin: EdgeInsets.only(top: 30),
                                    child: Text(
                                      "PUZZLES",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontFamily: "mathspzl"),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Column(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                    "Benifits Of Pro Version",style: TextStyle( color:Color(0xff000099),
                                                        fontWeight:FontWeight.bold,fontFamily:"mathspzl2")),
                                              ),
                                              Container(
                                                  margin:EdgeInsets.only(top: 15),
                                                  alignment: Alignment.topLeft,
                                                  child: Column(
                                                    children: [
                                                      Text("1. No Ads",style:TextStyle(fontSize: 17),
                                                      ),
                                                      Text(
                                                          "2. No Wait Time For Hint & Skip",
                                                          style: TextStyle(
                                                              fontSize: 17)),
                                                      Text(
                                                          "3. Hint For Every Level",
                                                          style: TextStyle(
                                                              fontSize: 17)),
                                                      Text(
                                                          "4. Solution For Every Level",
                                                          style: TextStyle(
                                                              fontSize: 17)),
                                                    ],
                                                  )),
                                              Row(
                                                mainAxisAlignment:MainAxisAlignment.spaceAround,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 20, right: 10),
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: GFButton(
                                                      onPressed: () {
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                "Not Available!!",
                                                            toastLength: Toast
                                                                .LENGTH_SHORT,
                                                            gravity:
                                                                ToastGravity
                                                                    .BOTTOM,
                                                            timeInSecForIosWeb:
                                                                1,
                                                            backgroundColor:
                                                                Colors.white,
                                                            textColor:
                                                                Colors.red,
                                                            fontSize: 16.0);
                                                      },
                                                      text: "BUY",
                                                      shape:
                                                          GFButtonShape.pills,
                                                      color: Color(0xff3333FF),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 20, left: 10),
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: GFButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      text: "NO,THANKS",
                                                      shape:
                                                          GFButtonShape.pills,
                                                      color: Color(0xff3333FF),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 2,
                                        // color: (t1 == true) ? Colors.white : Colors.black
                                      ),
                                    ),
                                    margin: EdgeInsets.only(top: 30),
                                    child: Text(
                                      "BUY PRO",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontFamily: "mathspzl"),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
