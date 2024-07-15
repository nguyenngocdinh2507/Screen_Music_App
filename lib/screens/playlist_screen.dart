import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:screen_music_app_1/widget/seekbar.dart';
import '../BE/models/playlist_model.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Playlist playList = Playlist.playlists[0];

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepPurple.shade800.withOpacity(0.8),
                Colors.deepPurple.shade200.withOpacity(0.8),
              ]
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0 ,
          title: const Text('Playing'),
          centerTitle: true,
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                          playList.imageUrl,
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.height * 0.3,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      playList.title,
                      style: Theme.of(context).textTheme
                              .headlineSmall!
                              .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                    )
                  ],
                ),
                 const SizedBox(height: 24,),
                _playorshuffle(),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: playList.songs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading:Text(
                          (index+1).toString(),
                        style: Theme.of(context).textTheme.bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                      title: Text(
                        playList.songs[index].title,
                        style: Theme.of(context).textTheme.bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                      ) ,
                      subtitle: Text(
                        playList.songs[index].description + " 4:25",
                      ) ,
                      trailing: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _playorshuffle extends StatefulWidget {
  _playorshuffle({
    super.key,
  });

  @override
  State<_playorshuffle> createState() => _playorshuffleState();
}

class _playorshuffleState extends State<_playorshuffle> {
  bool isPlay = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 38;
    return GestureDetector(
      onTap: () {
        setState((){
          isPlay = !isPlay;
        });
      },
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0)
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds:  200),
              left: isPlay ? 0 : width * 0.5,
              child: Container(
                height: 50,
                width: width * 0.5  ,
                decoration: BoxDecoration(
                    color: Colors.purple.shade400,
                    borderRadius: BorderRadius.circular(15.0)
                )
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Play',
                          style: TextStyle(
                              color: isPlay ? Colors.white : Colors.purple ,
                              fontSize: 17
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Icon(
                        Icons.play_circle,
                        color: isPlay ? Colors.white : Colors.purple ,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Shuffle',
                          style: TextStyle(
                              color: isPlay ? Colors.purple : Colors.white ,
                              fontSize: 17
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Icon(
                        Icons.shuffle,
                        color: isPlay ? Colors.purple : Colors.white ,
                      )
                    ],
                  ),
                )
              ],
            ),
          ]
        ),
      ),
    );
  }
}
