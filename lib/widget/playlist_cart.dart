import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../BE/models/playlist_model.dart';

class PlayListCart extends StatelessWidget {
  const PlayListCart({
    super.key,
    required this.playlist,
  });

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/playlist', arguments: playlist);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        height: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.purple.shade800.withOpacity(0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  playlist.imageUrl,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                )
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      playlist.title,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(
                        color:Colors.white,
                      ),
                    ),
                    Text(
                      '${playlist.songs.length} song',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                        color:Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              const Icon(
                Icons.play_circle,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}

