import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:my_musico/widgets/seekbar.dart';
import 'package:rxdart/rxdart.dart' as rxdart;
import '../models/song_model.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({Key? key}) : super(key: key);

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {

  AudioPlayer audioPlayer=AudioPlayer();
  Song song =Song.songs[4];


  @override
  void initState(){
    super.initState();

    audioPlayer.setAudioSource(
        ConcatenatingAudioSource(children: [
          AudioSource.uri(Uri.parse('asset:///${song.url}')),
        ])
    );
  }
  @override
  void dispose(){
    audioPlayer.dispose();
    super.dispose();
  }

  Stream<SeekBarData>get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration,Duration?,SeekBarData>(
          audioPlayer.positionStream,
          audioPlayer.durationStream,
              (
              Duration position, Duration? duration,){
            return SeekBarData(position,duration??Duration.zero);
          }

      );


  @override
  Widget build(BuildContext context) {




    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
            Image.asset(song.coverUrl,fit: BoxFit.cover,),
          _BackgroundFilter()
        ],
      ),
    );

  }
}

class _BackgroundFilter extends StatelessWidget {
  const _BackgroundFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect){
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                  Colors.white,
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.0),
                  ],
                  stops: [
                    0.0,
                    0.4,
                    0.6,
                  ]
                ).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple.shade200,
              Colors.deepPurple.shade800,
            ],
          ),
        ),
      ),
    );
  }
}
