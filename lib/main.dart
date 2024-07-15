import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screen_music_app_1/screens/home_screen.dart';
import 'package:screen_music_app_1/screens/song_screen.dart';
import 'screens/playlist_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo Screen Music App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      getPages: [
        GetPage(name: '/', page:() => const HomeScreen()),
        GetPage(name: '/song', page:() => const SongScreen()),
        GetPage(name: '/playlist', page:() => const PlaylistScreen()),
      ]
    );
  }
}
