import 'package:flutter/material.dart';

class PlayPauseProvider with ChangeNotifier {
  AnimationController _controller;
  bool _isPlaying = false;
  Duration _songDuration = new Duration(milliseconds: 0);
  Duration _current = new Duration(milliseconds: 0);

  double get porcentaje => (this._songDuration.inSeconds > 0)
      ? this._current.inSeconds / this._songDuration.inSeconds
      : 0;

  String get songTotalDuration => this.printDuration(_songDuration);
  String get currentSecond => this.printDuration(_current);

  set controller(AnimationController val) {
    this._controller = val;
  }

  AnimationController get controller => this._controller;

  bool get isPlaying => this._isPlaying;
  set isPlaying(bool val) {
    this._isPlaying = val;
    notifyListeners();
  }

  Duration get songDuration => this._songDuration;
  set songDuration(Duration val) {
    this._songDuration = val;
    notifyListeners();
  }

  Duration get current => this._current;
  set current(Duration val) {
    this._current = val;
    notifyListeners();
  }

  String printDuration(Duration duration) {
    String twoDuration(int n) {
      if (n >= 10) {
        return "0$n";
      }
      return '';
    }

    String twoDigitMinutes = twoDuration(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDuration(duration.inMinutes.remainder(60));

    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
