import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_musico/main.dart';
import 'package:get/get.dart';
import 'package:my_musico/screens/playlist_screen.dart';
import 'package:my_musico/screens/song_screen.dart';

import 'screens/home_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,

        )
      ),
      home:  HomeScreen(),
      getPages: [
        GetPage(name: '/', page: ()=>const HomeScreen()),
        GetPage(name: '/song', page: ()=>const SongScreen()),
        GetPage(name: '/playlist', page: ()=>const PlaylistScreen()),

      ],
    );
  }
}
