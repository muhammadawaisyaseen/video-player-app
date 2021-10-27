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
            Container(
              padding: EdgeInsets.only(top: 70, left: 30, right: 30),
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.arrow_back_ios, size: 20, color: Colors.white),
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
