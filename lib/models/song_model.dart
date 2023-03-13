class Song{
  final String title;
  final String description;
  final String url;
  final String coverUrl;
  // print('sumit');
  Song({
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl,
});

  static List<Song> songs=[
   Song(
     title:'Barbaadiyan',
     description:"Glass",
     url:'assets/music/infected_sidekick.mp3',
     coverUrl:'assets/images/barbadiyan.jpeg',
   ),
    Song(
      title:'Tere Naal',
      description:"Glass",
      url:'assets/music/infected_sidekick.mp3',
      coverUrl:'assets/images/TereNaal.jpeg',
    ),
    Song(
      title:'Arijit Greatest',
      description:"Glass",
      url:'assets/music/infected_sidekick.mp3',
      coverUrl:'assets/images/ArijitGreatest.jpeg',
    ),
    Song(
      title:'infected',
      description:"Glass",
      url:'assets/music/infected_sidekick.mp3',
      coverUrl:'assets/images/sidekick_infected.jpg',
    ),
    Song(
      title:'Tu Mileya',
      description:"Glass",
      url:'assets/music/infected_sidekick.mp3',
      coverUrl:'assets/images/TuMileya.jpg',
    ),

  ];
}