import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/playlist_model.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<Song>songs=Song.songs;
    Playlist playlists=Playlist.playlists[0];
    return  Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurple.shade800.withOpacity(0.8),
            Colors.deepPurple.shade200.withOpacity(0.8),
          ],
        ),
      ),
      child:  Scaffold(
          backgroundColor: Colors.transparent,
          appBar:  AppBar(backgroundColor: Colors.transparent,elevation: 0,title: Center(child: Text('Playlist')),),

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                    _PlaylistInformation(playlists: playlists),
                  SizedBox(height: 30,),
                  PlayOrShuffleSwitch(),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: playlists.songs.length,
                    itemBuilder: (context,index){
                      return ListTile(
                        leading: Text(
                          '${index+1}',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        title: Text(
                          playlists.songs[index].title,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        subtitle: Text(
                          '${playlists.songs[index].description} ∘ 02.45'
                        ),
                        trailing: Icon(Icons.more_vert,
                          color: Colors.white,
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}

class PlayOrShuffleSwitch extends StatefulWidget {
  const PlayOrShuffleSwitch({
    super.key,
  });

  @override
  State<PlayOrShuffleSwitch> createState() => _PlayOrShuffleSwitchState();
}

class _PlayOrShuffleSwitchState extends State<PlayOrShuffleSwitch> {

  bool isPlay=true;
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        setState(() {
          isPlay =!isPlay;
        });
      },
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
          AnimatedPositioned(
            duration:Duration(milliseconds: 200) ,
            left: isPlay?0:width*0.45,
            child: Container(
            height: 50,
            width: width*0.45,
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade400,
              borderRadius: BorderRadius.circular(15),
            ),
            ),
          ),
            Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Play',
                    style: TextStyle(color: isPlay?Colors.white:Colors.deepPurple,
                    fontSize: 17,
                    ),
                    ),
                    SizedBox(width: 10,),
                    Icon(
                      Icons.play_circle,
                      color: isPlay?Colors.white:Colors.deepPurple,
                    )
                  ],
                ),
              ),

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text('Shuffle',
                        style: TextStyle(color: isPlay?Colors.deepPurple:Colors.white,
                       fontSize: 17,
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Icon(
                      Icons.shuffle,
                      color: isPlay?Colors.deepPurple:Colors.white,
                    )
                  ],
                ),
              ),

            ],
          ),
        ]
        ),
      ),
    );
  }
}

class _PlaylistInformation extends StatelessWidget {
  const _PlaylistInformation({
    super.key,
    required this.playlists,
  });

  final Playlist playlists;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(playlists.imageUrl,
            height: MediaQuery.of(context).size.height*0.3,
              width: MediaQuery.of(context).size.height*0.3,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height:30),
        Text(playlists.title,
          style:Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold
          ) ,
        ),
      ],
    );
  }
}


