import 'package:flutter/material.dart';
import 'package:screen_music_app_1/BE/models/song_model.dart';
import 'package:screen_music_app_1/widget/seekbar.dart';
import 'package:just_audio/just_audio.dart';

class PlayerButtons extends StatelessWidget {
  const PlayerButtons({
    super.key,
    required this.song,
    required Stream<SeekBarData> seekBarDataStream,
    required this.audioPlayer,
  }) : _seekBarDataStream = seekBarDataStream;

  final Stream<SeekBarData> _seekBarDataStream;
  final AudioPlayer audioPlayer;
  final Song song;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      
      children: [
        StreamBuilder<SequenceState?>(
            stream: audioPlayer.sequenceStateStream,
            builder: (context, snapshot) {
              return IconButton(
                  onPressed: audioPlayer.hasPrevious ?
                  audioPlayer.seekToPrevious : null,
                  iconSize: 45,
                  icon: const Icon(
                    Icons.skip_previous,
                    color: Colors.white,
                  )
              );
            },
        ),
        StreamBuilder<PlayerState>(
          stream: audioPlayer.playerStateStream,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              final playersState = snapshot.data;
              final processingState =
                  playersState!.processingState;
              if(processingState == ProcessingState.loading ||
                  processingState == ProcessingState.buffering){
                return Container(
                  width: 64.0,
                  height: 64.0,
                  margin: const EdgeInsets.all(10.0),
                  child: const CircularProgressIndicator(),
                );
              } else if(!audioPlayer.playing){
                return IconButton(
                    onPressed: audioPlayer.play,
                    iconSize: 75,
                    icon: const Icon(
                      Icons.play_circle,
                      color: Colors.white,
                    )
                );
              } else if(processingState != ProcessingState.completed){
                return IconButton(
                    onPressed: audioPlayer.pause,
                    iconSize: 75,
                    icon: const Icon(
                      Icons.pause_circle,
                      color: Colors.white,
                    )
                );
              }
              else{
                return IconButton(
                    onPressed: () => audioPlayer.seek(
                        Duration.zero,
                        index: audioPlayer.effectiveIndices!.first
                    ),
                    iconSize: 75,
                    icon: const Icon(
                      Icons.replay_circle_filled,
                      color: Colors.white,
                    )
                );
              }
            }
            else{
              return const CircularProgressIndicator();
            }
          },
        ),
        StreamBuilder<SequenceState?>(
          stream: audioPlayer.sequenceStateStream,
          builder: (context, snapshot) {
            return IconButton(
                onPressed: audioPlayer.hasNext ?
                audioPlayer.seekToNext : null,
                iconSize: 45,
                icon: const Icon(
                  Icons.skip_next,
                  color: Colors.white,
                )
            );
          },
        )
      ],
    );
      
  }
}
