import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:music_player/src/providers/PlayPauseProvider.dart';
import 'package:provider/provider.dart';

class CoverAndProgresiveMusic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 80, left: 20),
      child: Row(
        children: [
          DiscCover(),
          SizedBox(
            width: 50,
          ),
          //progresive
          ProgresiveBar()
        ],
      ),
    );
  }
}

class ProgresiveBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PlayPauseProvider>(context);
    final double porcentaje = provider.porcentaje;
    return Column(
      children: [
        Text(provider.songTotalDuration),
        SizedBox(
          height: 10,
        ),
        Stack(
          children: [
            Container(
              width: 3,
              height: 230,
              color: Colors.white.withOpacity(0.1),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 3,
                height: 230 * porcentaje,
                color: Colors.white.withOpacity(0.8),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(provider.currentSecond)
      ],
    );
  }
}

class DiscCover extends StatelessWidget {
  final String asset;

  const DiscCover({Key key, this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playController = Provider.of<PlayPauseProvider>(context);
    return Container(
      padding: EdgeInsets.all(20),
      width: 250,
      height: 250,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SpinPerfect(
              duration: Duration(seconds: 10),
              infinite: true,
              manualTrigger: true,
              controller: (animationController) =>
                  playController.controller = animationController,
              child: Image(
                image: AssetImage('assets/aurora.jpg'),
              ),
            ),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(100)),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100)),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: [Color(0xff484750), Color(0xff1E1C24)])),
    );
  }
}
