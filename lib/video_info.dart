import 'dart:convert';

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoinfo = [];

  get children => null;

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("lib/jsondata/videoinfo.json")
        .then((value) {
      setState(() {
        videoinfo = json.decode(value);
      });
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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(0, 0, 255, 1),
            Color.fromRGBO(0, 128, 255, 0.9)
          ], begin: Alignment.bottomLeft, end: Alignment.topRight),
        ),
        child: Column(
          children: [
            // Expended and flex(divide screens) is liay use kia hy taa k har device pay responsive ho ye chez hmesha Row/Column may use krty hyn.
            Expanded(
              flex: 1,
              child: Container(
                // color: Colors.red,
                padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(Icons.arrow_back_ios,
                              size: 20, color: Colors.white),
                        ),
                        const Spacer(),
                        const Icon(Icons.info_outline,
                            size: 20, color: Colors.white),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Legs Toning",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "and Glutes Workout",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.only(left: 9, right: 9),
                            width: 90,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                  colors: [
                                    Color.fromRGBO(0, 128, 255, 1),
                                    Color.fromRGBO(0, 128, 255, 1)
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight),
                            ),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.timer,
                                  size: 14,
                                  color: Colors.white,
                                ),
                                Spacer(),
                                Text("68 min",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white)),
                              ],
                            )),
                        const SizedBox(width: 20),
                        // roef  /// /  /  / / / / / / / / / / / /  / / / / / / / / / / / / / / / / /
                        Container(
                            padding: const EdgeInsets.only(left: 9, right: 9),
                            width: 200,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                  colors: [
                                    Color.fromRGBO(0, 128, 255, 1),
                                    Color.fromRGBO(0, 128, 255, 1)
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight),
                            ),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.handyman_outlined,
                                  size: 14,
                                  color: Colors.white,
                                ),
                                Spacer(),
                                Text("Resistent band, kettebell",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white)),
                              ],
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
            // Next Container is stsrted for videos part
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(70))),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Circuit 1 : Legs Toning",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Icon(Icons.loop, size: 30, color: Colors.blueAccent),
                          SizedBox(
                            width: 5,
                          ),
                          Text("3 sets",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                              )),
                        ],
                      ),
                      Expanded(
                          // flex: 14,

                          child: ListView.builder(
                        itemCount: videoinfo.length,
                        itemBuilder: (_, int index) {
                          return GestureDetector(
                              onTap: () {
                                //debugprint(index.toString());
                                print("Awais Yaseen");
                              },
                              child: Container(
                                //padding: EdgeInsets.all(40),
                                height: 135,
                                //width: 200,
                                //color: Colors.green,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    videoinfo[index]
                                                        ["thumbnail"])),
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              videoinfo[index]["title"],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              videoinfo[index]["time"],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey[700]),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFeaeefc),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              "15s set",
                                              style: TextStyle(
                                                color: Color(0xFF839fed),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    // Row(
                                    //   children: [
                                        
                                    //   ],
                                    // )
                                  ],
                                ),
                              ));
                        },
                      )),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
