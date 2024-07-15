import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../BE/models/song_model.dart';

class SongCart extends StatelessWidget {
  const SongCart({
    super.key,
    required this.song,
    required this.position,
  });

  final Song song;
  final int position;

  @override
  Widget build(BuildContext context) {
    List<Song> songs = Song.songs;

    return InkWell(
      onTap: () {
        Get.toNamed('/song', arguments: song);
      },
      child: Container(
        padding: (position != songs.length - 1 && position != 0)
            ? const EdgeInsets.symmetric(horizontal: 6.0)
            : EdgeInsets.zero,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: AssetImage(song.coverUrl),
                    fit: BoxFit.cover,
                  )),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.37,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white.withOpacity(0.8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start ,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        song.title,
                        style: Theme.of(context).textTheme
                        .titleSmall!
                        .copyWith(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        song.description,
                        style: Theme.of(context).textTheme
                            .titleSmall!
                            .copyWith(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                  const Icon(
                    Icons.play_circle,
                    color: Colors.deepPurple,
                  )
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}
