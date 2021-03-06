import 'package:flutter/material.dart';
import 'package:music_player/src/pages/music_player_page.dart';
import 'package:music_player/src/providers/PlayPauseProvider.dart';
import 'package:music_player/src/themes/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: miTema,
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => new PlayPauseProvider())
          ],
          child: MusicPlayerPage()));
  }
}
