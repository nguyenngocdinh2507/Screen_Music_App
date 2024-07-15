class Song{
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song({
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl
  });

  static List<Song> songs = [
    Song(
        title: 'H T C A',
        description: 'MTP',
        url: 'assets/songs/htca.mp3',
        coverUrl: 'assets/images/st.jpg'
    ),
    Song(
        title: 'Không say',
        description: 'Hieu',
        url: 'assets/songs/kts.mp3',
        coverUrl: 'assets/images/hth.jpg'
    ),
    Song(
        title: 'Waiting...',
        description: 'Mono-Lun',
        url: 'assets/songs/wtfu.mp3',
        coverUrl: 'assets/images/mn.jpg'
    )
  ];
}
