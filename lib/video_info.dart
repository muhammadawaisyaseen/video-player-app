import "package:flutter/material.dart";

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
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
                      children: const [
                        Icon(Icons.arrow_back_ios,
                            size: 20, color: Colors.white),
                        Spacer(),
                        Icon(Icons.info_outline, size: 20, color: Colors.white),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
