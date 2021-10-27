// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);

  // He use stateful widget
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  List info = [];

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("lib/jsondata/info.json")
        .then((value) {
      setState(() {
        info = json.decode(value);
      });
      //print(info[0]["img"]);
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   title: const Text("Awais"),
        // ),

        body: Container(
            //color: Colors.red,
            padding: const EdgeInsets.only(
              top: 50,
              left: 30,
              right: 30,
            ),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text("Tranings",
                        style: TextStyle(fontSize: 30, color: Colors.black)),
                    //Expanded(child: Container()),
                    Spacer(),
                    Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
                    SizedBox(
                      width: 7,
                    ),
                    Icon(Icons.calendar_today_outlined,
                        size: 20, color: Colors.black),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.arrow_forward_ios,
                        size: 20, color: Colors.black),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Text("Your Program",
                        style: TextStyle(fontSize: 20, color: Colors.black38)),
                    Spacer(),
                    Text("Details",
                        style: TextStyle(color: Colors.blue, fontSize: 20)),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.arrow_forward, size: 20),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 220,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topRight: Radius.circular(80),
                      ),
                      gradient: LinearGradient(
                          colors: const [
                            Color.fromRGBO(0, 0, 255, 1),
                            Color.fromRGBO(0, 128, 255, 0.7)
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.centerRight),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(2, 2),
                          color: Color.fromRGBO(0, 128, 255, 0.2),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Container(
                      padding: EdgeInsets.only(top: 20, left: 15, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Next Workout",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Legs Toning",
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "and Glutes Workout",
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.timer,
                                size: 14,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("60 min",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white)),
                              Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 20,
                                      color: Color.fromRGBO(0, 0, 255, 1),
                                      offset: Offset(4, 8),
                                    )
                                  ],
                                ),
                                child: Icon(
                                  Icons.play_circle_fill,
                                  size: 60,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  //color: Colors.grey,
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            //color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage("lib/myassets/white.PNG"),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(0, 128, 255, 0.3),
                                blurRadius: 40,
                                offset: Offset(8, 10),
                              ),
                              BoxShadow(
                                color: Color.fromRGBO(0, 128, 255, 0.3),
                                blurRadius: 10,
                                offset: Offset(-1, -5),
                              ),
                            ]),
                      ),
                      Positioned(
                          top: -20,
                          height: 100,
                          child: Image.asset(
                            "lib/myassets/body.png",
                          )),
                      Container(
                        height: 90,
                        width: MediaQuery.of(context).size.width,
                        //color: Colors.yellowAccent.withOpacity(0.5),
                        margin: EdgeInsets.only(left: 120, top: 10),
                        padding: EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "You are doing great",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "keep it up",
                              style: TextStyle(
                                //color: Colors.black54,
                                color: Color.fromRGBO(90, 90, 90, 1),
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "stick to your plan",
                              style: TextStyle(
                                color: Color.fromRGBO(90, 90, 90, 1),
                                //color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: const [
                    Text("Area of focus",
                        style: TextStyle(
                            fontSize: 22,
                            //fontWeight: FontWeight.bold,
                            color: Colors.black))
                  ],
                ),
                Expanded(
                    child: GridView.builder(
                        itemCount: info.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          //childAspectRatio: 9 / 12,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(bottom: 14),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(5, 5),
                                  //color: Colors.deepOrange,
                                  color: Color.fromRGBO(0, 128, 255, 0.1),
                                ),
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(-5, -5),
                                  //color: Colors.deepOrange,
                                  color: Color.fromRGBO(0, 128, 255, 0.1),
                                )
                              ],
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  info[index]["img"],
                                  //"lib/myassets/chest.png",
                                  height: 120,
                                ),
                                Spacer(),
                                Text(
                                  //"Legs",
                                  info[index]["title"],
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          );
                        })),
              ],
            )));
  }
}
