import 'package:screen_music_app_1/BE/models/song_model.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlist({
    required this.title,
    required this.songs,
    required this.imageUrl
  });

  static List<Playlist> playlists = [
    Playlist(
        title: 'Hieu Thu 2',
        songs: Song.songs,
        imageUrl: 'assets/images/hth.jpg'
    ),
    Playlist(
        title: 'Mo no',
        songs: Song.songs,
        imageUrl: 'assets/images/mn.jpg'
    ),Playlist(
        title: 'SonTung-MTP',
        songs: Song.songs,
        imageUrl: 'assets/images/st.jpg'
    ),
  ];
}
