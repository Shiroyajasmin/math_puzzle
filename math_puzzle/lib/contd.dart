// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, unnecessary_string_interpolations, unnecessary_brace_in_string_interps, prefer_interpolation_to_compose_strings, non_constant_identifier_names, unrelated_type_equality_checks, sort_child_properties_last, use_key_in_widget_constructors, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:math_puzzle/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class contd extends StatefulWidget {
  int crnt_lvl;
  List level_status;
  contd(this.crnt_lvl,this.level_status);

  @override
  State<contd> createState() => _contdState();
}
class _contdState extends State<contd> {

  String str = "";
  List ans = [10,20,30,40,50,60,70,80,90,100,];
  List level_status=[];
  int crnt_lvl = 0;
  SharedPreferences? pref;
  List myimages = ["myimages/p1.png","myimages/p2.png","myimages/p3.png","myimages/p4.png","myimages/p5.png",
    "myimages/p6.png","myimages/p7.png","myimages/p8.png","myimages/p9.png","myimages/p10.png",];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init_shard_fun();
    crnt_lvl = widget.crnt_lvl;
    level_status=widget.level_status;
  }
  init_shard_fun() async {
    pref = await SharedPreferences.getInstance();
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
                      image: AssetImage("myimages/gameplaybackground.jpg"),
                      fit: BoxFit.fill)),
              child: Column (
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            pref!.setString("levek_status$crnt_lvl","skip");
                            crnt_lvl++;
                            crnt_lvl.toInt();
                            pref!.setInt("levelNo", crnt_lvl);
                            Navigator.push(context, MaterialPageRoute( builder: (context) {
                                return contd(crnt_lvl,level_status);
                               },
                            ));
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 15),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("myimages/skip.png"),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      InkWell(
                        onTap:() {
                          Navigator.push(context,MaterialPageRoute(builder: (context) {
                            return myApp();
                          },));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 10),
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("myimages/level_board.png"),
                                  fit: BoxFit.fill)),
                          child: Text("Puzzle ${crnt_lvl + 1}",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: "mathspzl2",
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic)),
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
                                      alignment: Alignment.topLeft,
                                      child: Text("Hint"),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 15),
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        "Write a right ansewrs and keep It up..!!",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomRight,
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            },child: Text("OK")),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 15),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("myimages/hint.png"),
                                  fit: BoxFit.fill)),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 330,
                    width: 330,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("${myimages[crnt_lvl]}"),
                            fit: BoxFit.fill)),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 221),
                            color: Colors.black,
                            height: 60,
                            width: 200,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(color: Colors.blue)),
                                margin: EdgeInsets.only(
                                    left: 6, top: 10, bottom: 10),
                                height: 30,
                                width: 30,
                                child: Text(
                                  "${str}",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 19),
                                ),
                                alignment: Alignment.centerLeft),
                          ),
                          InkWell(
                            child: Container(
                              margin: EdgeInsets.only(top: 221),
                              color: Colors.black,
                              height: 60,
                              width: 60,
                              child: Container(
                                margin: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage("myimages/delete.png"),
                                        fit: BoxFit.fitHeight)),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                str = str.substring(0, str.length - 1);
                              });
                            },
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 221),
                              height: 60,
                              color: Colors.black,
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: 9,
                                  bottom: 9,
                                  right: 3,
                                ),
                                child: GFButton(
                                  onPressed: () {
                                    setState(() {
                                      if (int.parse(str) == ans[crnt_lvl]) {
                                        crnt_lvl++;
                                        pref!.setInt("levelNo", crnt_lvl);
                                        Navigator.push(context,MaterialPageRoute( builder: (context) {
                                            return contd(crnt_lvl,level_status);
                                          },
                                        ));
                                      }
                                      else {
                                        Fluttertoast.showToast(
                                            msg: "Wrong Answer!!",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.white,
                                            textColor: Colors.red,
                                            fontSize: 16.0);
                                       }
                                    });
                                  },
                                  text: "SUBMIT",
                                  textStyle: TextStyle(fontSize: 15),
                                  shape: GFButtonShape.pills,
                                  type: GFButtonType.outline,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.black,
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        str = str + "1";
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white24,
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          border: Border.all(
                                              color: Colors.white54)),
                                      height: 38,
                                      width: 30,
                                      child: Text(
                                        "1",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        str = str + "2";
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white24,
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          border: Border.all(
                                              color: Colors.white54)),
                                      height: 38,
                                      width: 30,
                                      child: Text(
                                        "2",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        str = str + "3";
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white24,
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          border: Border.all(
                                              color: Colors.white54)),
                                      height: 38,
                                      width: 30,
                                      child: Text(
                                        "3",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        str = str + "4";
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white24,
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          border: Border.all(
                                              color: Colors.white54)),
                                      height: 38,
                                      width: 30,
                                      child: Text(
                                        "4",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        str = str + "5";
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white24,
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          border: Border.all(
                                              color: Colors.white54)),
                                      height: 38,
                                      width: 30,
                                      child: Text(
                                        "5",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        str = str + "6";
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white24,
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          border: Border.all(
                                              color: Colors.white54)),
                                      height: 38,
                                      width: 30,
                                      child: Text(
                                        "6",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        str = str + "7";
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white24,
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          border: Border.all(
                                              color: Colors.white54)),
                                      height: 38,
                                      width: 30,
                                      child: Text(
                                        "7",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        str = str + "8";
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white24,
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          border: Border.all(
                                              color: Colors.white54)),
                                      height: 38,
                                      width: 30,
                                      child: Text(
                                        "8",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        str = str + "9";
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white24,
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          border: Border.all(
                                              color: Colors.white54)),
                                      height: 38,
                                      width: 30,
                                      child: Text(
                                        "9",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        str = str + "0";
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white24,
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          border: Border.all(
                                              color: Colors.white54)),
                                      height: 38,
                                      width: 30,
                                      child: Text(
                                        "0",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
