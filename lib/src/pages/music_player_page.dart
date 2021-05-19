import 'package:flutter/material.dart';
import 'package:music_player/src/widgets/custom_widgets.dart';

class MusicPlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          Column(
            children: [
              CustomAppbar(),
              CoverAndProgresiveMusic(),
              MusicTitleAndPlayButton(),
              Expanded(child: Lyrics())
            ],
          ),
        ],
      ),
    );
  }
}
