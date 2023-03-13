import 'package:flutter/cupertino.dart';

class SeekBarData{
  final Duration position;
  final Duration duration;

  SeekBarData(this.position,this.duration);
}

class SeekBar extends StatefulWidget {
  const SeekBar({Key? key}) : super(key: key);

  @override
  State<SeekBar> createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
