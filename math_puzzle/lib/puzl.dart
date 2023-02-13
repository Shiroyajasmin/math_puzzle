// ignore_for_file: prefer_const_constructors, camel_case_types, non_constant_identifier_names, use_key_in_widget_constructors, must_be_immutable, sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:math_puzzle/contd.dart';
import 'package:math_puzzle/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class puzl extends StatefulWidget {
  int crnt_lvl;
  List level_status;

  puzl(this.crnt_lvl, this.level_status);

  @override
  State<puzl> createState() => _puzlState();
}

class _puzlState extends State<puzl> {
  List ans = [ 10,20,30,40,50,60,70,80,90,100,];
  int crnt_lvl = 0;
  List level_status = [];
  SharedPreferences? pref;
  String str = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    level_status = widget.level_status;
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
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(),
                        child: Text(
                          "Select Puzzles",
                          style: TextStyle(
                              fontSize: 29,
                              color: Color(0xff000099).withOpacity(0.7),
                              fontFamily: "mathspzl2",
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 610,width: 330,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 1,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 6,
                        ),
                        itemCount: ans.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return contd(crnt_lvl, level_status);
                                },
                              ));
                            },
                            child: Container(
                              height: 500,alignment:Alignment.center,
                              child: (index < widget.crnt_lvl)
                                      ? Text("${index + 1}",style:TextStyle(fontSize:37),)
                                      : null,
                              decoration: BoxDecoration(
                                      image: (level_status[index] == "yes")
                                      ? DecorationImage(image:AssetImage("myimages/tick.png"))
                                      : (level_status[index] == "skip")
                                      ? null
                                      : DecorationImage(image: AssetImage("myimages/lock.png")),
                              )
                            ),
                          );
                        },
                      ),
                    ),
                    InkWell(
                      child: Container(
                          height: 50,width: 50,
                          margin: EdgeInsets.only(bottom: 30, right: 260),
                          decoration: BoxDecoration( image: DecorationImage(
                                  image: AssetImage("myimages/back.png"),fit: BoxFit.fill))),
                        onTap: () {
                          Navigator.push(context,MaterialPageRoute( builder: (context) {
                              return myApp();
                            },
                          ),
                        );
                      },
                    )
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
