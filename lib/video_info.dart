import 'dart:convert';

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  bool _playarea = false;
  VideoPlayerController? _controller;
  bool _isplaying = false;
  bool _disposed = false;
  int _isplayingindex = -1;
  List videoinfo = [];

  //get children => null;

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
  void dispose() {
    // ? means if exist
    super.dispose();
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    _disposed = true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: _playarea == false
              ? const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(0, 0, 255, 1),
                    Color.fromRGBO(0, 128, 255, 0.9)
                  ], begin: Alignment.bottomLeft, end: Alignment.topRight),
                )
              : const BoxDecoration(
                  color: Color.fromRGBO(0, 128, 255, 0.9),
                ),
          child: Column(
            children: [
              // Expended and flex(divide screens) is liay use kia hy taa k har device pay responsive ho ye chez hmesha Row/Column may use krty hyn.
              // Expanded(
              //   flex: 1,
              //   child:
              _playarea == false
                  ? Container(
                      // color: Colors.red,
                      padding:
                          const EdgeInsets.only(top: 70, left: 30, right: 30),
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
                                  padding:
                                      const EdgeInsets.only(left: 9, right: 9),
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
                                              fontSize: 14,
                                              color: Colors.white)),
                                    ],
                                  )),
                              const SizedBox(width: 20),
                              // roef  /// /  /  / / / / / / / / / / / /  / / / / / / / / / / / / / / / / /
                              Container(
                                  padding:
                                      const EdgeInsets.only(left: 9, right: 9),
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
                                              fontSize: 14,
                                              color: Colors.white)),
                                    ],
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  : Container(
                      // padding:
                      //     const EdgeInsets.only(top: 50, left: 30, right: 30),
                      // height: 271,
                      //color: Colors.red,
                      child: Column(
                        children: [
                          //child:
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 30, right: 30),
                            child: Row(
                              children: [
                                InkWell(
                                    onTap: () {
                                      //print("Awais press");
                                    },
                                    child: const Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                                const Spacer(),
                                const Icon(
                                  Icons.info_outline,
                                  color: Colors.white,
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          _playview(context),
                          // contro; view in tutorial
                          _controlvideobutton(context),
                        ],
                      ),
                    ),
              //),
              // Next Container is stsrted for videos list part
              Expanded(
                //flex: 2,
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
                            Icon(Icons.loop,
                                size: 30, color: Colors.blueAccent),
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
                            child: ListView.builder(
                          itemCount: videoinfo.length,
                          itemBuilder: (_, int index) {
                            return GestureDetector(
                              onTap: () {
                                // initilization of video link or get the video
                                _ontapvideo(index);
                                setState(() {
                                  if (_playarea == false) {
                                    _playarea = true;
                                  }
                                });
                              },
                              child: _buildcard(index),
                            );
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
      ),
    );
  }

  _buildcard(index) {
    return Container(
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
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(videoinfo[index]["thumbnail"])),
                ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
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
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "15s set",
                    style: TextStyle(
                      color: Color(0xFF839fed),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  for (int i = 0; i < 90; i++)
                    i.isEven
                        ? Container(
                            height: 1,
                            width: 3,
                            decoration: BoxDecoration(
                              color: const Color(0xFF839fed),
                              borderRadius: BorderRadius.circular(2),
                            ))
                        : Container(
                            width: 3,
                            height: 1,
                            color: Colors.white,
                          )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

// This is another function
  Widget _playview(BuildContext context) {
    final controllerInFunction = _controller;
    if (controllerInFunction != null &&
        controllerInFunction.value.isInitialized) {
      return AspectRatio(
        // height: 300,
        // width: 300,
        aspectRatio: 16 / 9,
        child: VideoPlayer(controllerInFunction),
      );
    } else {
      return const AspectRatio(
          aspectRatio: 16 / 9,
          child: Center(
            child: Text(
              "Preparing.......",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ));
    }
  }

// This fun is use in _ontapvideo() for addlistener()
  var _onupdatecontrollertime;
  void _oncontrollerupdate() async {
    if (_disposed) {
      return;
    }
    var _onupdatecontrollertime = 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (_onupdatecontrollertime > now) {
      return;
    }
    _onupdatecontrollertime = now + 500;
    final controller = _controller;
    if (controller == null) {
      print("controller is null");
      return;
    }
    if (!controller.value.isInitialized) {
      // ignore: avoid_print
      print("controller can't be initialize");
      return;
    }
    final playing = controller.value.isPlaying;
    //print(playing);
    _isplaying = playing;
  }

  // Following fun use to get the video with index
  _ontapvideo(int index) {
    //controller is local _controller is a global variable
    final controller =
        VideoPlayerController.network(videoinfo[index]["videoUrl"]);
    final oldcontroller = _controller;
    setState(() {
      _controller = controller;
    });

    if (oldcontroller != null) {
      oldcontroller.removeListener(_oncontrollerupdate);
      oldcontroller.pause();
    }

    // when you play next video then previous will become old controller

    _controller!.initialize().then((value) {
      // ? means exist (if old controller exist then dispose it because we want initilization of next video)
      //print("click huwa hy k ni");
      oldcontroller?.dispose();
      // (_isplayingindex)index of currently playing video
      _isplayingindex = index;
      controller.addListener(_oncontrollerupdate);
      setState(() {
        _controller!.play();
      });
    });
  }

  // control view
  Widget _controlvideobutton(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      color: Color.fromRGBO(0, 128, 255, 0.1),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
              onPressed: () async {
                final index = _isplayingindex - 1;
                if (index >= 0 && videoinfo.length >= 0) {
                  _ontapvideo(index);
                } else {
                  Get.snackbar("Video", "No more video to play");
                }
              },
              child: const Icon(
                Icons.fast_rewind,
                size: 36,
                color: Colors.white,
              )),
          //
          FlatButton(
              onPressed: () async {
                if (_isplaying == true) {
                  _controller?.pause();
                  setState(() {
                    _isplaying = false;
                  });
                } else if (_isplaying == false) {
                  _controller?.play();
                  setState(() {
                    _isplaying = true;
                  });
                }
              },
              child: _isplaying
                  ? const Icon(
                      Icons.pause,
                      size: 36,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.play_arrow,
                      size: 36,
                      color: Colors.white,
                    )),
          //
          FlatButton(
              onPressed: () async {
                final index = _isplayingindex + 1;
                if (index <= videoinfo.length-1) {
                  _ontapvideo(index);
                } else {
                  Get.snackbar("Video", "No more video to play");
                }
              },
              child: const Icon(
                Icons.fast_forward,
                size: 36,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
