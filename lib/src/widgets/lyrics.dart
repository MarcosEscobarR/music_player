import 'package:flutter/material.dart';
import 'package:music_player/src/helpers/helpers.dart';

class Lyrics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lyric = getLyrics();
    return Container(
      child: ListWheelScrollView(
          itemExtent: 42,
          diameterRatio: 1.5,
          physics: BouncingScrollPhysics(),
          children: lyric
              .map((verso) => Text(
                    verso,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.6), fontSize: 20),
                  ))
              .toList()),
    );
  }
}
