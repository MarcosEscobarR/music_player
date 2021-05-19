import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/src/providers/PlayPauseProvider.dart';
import 'package:provider/provider.dart';

class MusicTitleAndPlayButton extends StatefulWidget {
  @override
  _MusicTitleAndPlayButtonState createState() =>
      _MusicTitleAndPlayButtonState();
}

class _MusicTitleAndPlayButtonState extends State<MusicTitleAndPlayButton>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  bool isPlaying = false;
  bool isFirstTime = true;
  final assetsAudioPlayer = new AssetsAudioPlayer();

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void open() {
    final provider = Provider.of<PlayPauseProvider>(context, listen: false);
    assetsAudioPlayer.open(Audio.file('assets/Breaking-Benjamin-Far-Away.mp3'));

    assetsAudioPlayer.currentPosition.listen((duration) {
      provider.current = duration;
    });

    assetsAudioPlayer.current.listen((playing) {
      provider.songDuration = playing.audio.duration;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50, bottom: 35),
      child: Row(
        children: [
          SizedBox(
            width: 50,
          ),
          Column(
            children: [
              Text(
                "Far Away",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 30,
                ),
              ),
              Text(
                "-Breacking Benjamin-",
                style: TextStyle(color: Colors.white.withOpacity(0.5)),
              )
            ],
          ),
          Spacer(),
          FloatingActionButton(
            elevation: 0,
            highlightElevation: 0,
            backgroundColor: Color(0xffF8CB51),
            child: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: controller,
            ),
            onPressed: () {
              final playController =
                  Provider.of<PlayPauseProvider>(context, listen: false);
              if (isPlaying) {
                controller.reverse();
                this.isPlaying = false;
                playController.controller.stop();
              } else {
                controller.forward();
                this.isPlaying = true;
                playController.controller.repeat();
              }

              if (isFirstTime) {
                open();
                this.isFirstTime = false;
              } else {
                this.assetsAudioPlayer.playOrPause();
              }
            },
          ),
          SizedBox(
            width: 50,
          )
        ],
      ),
    );
  }
}
