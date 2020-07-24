class Music {
  final String title, artist, album, label, description, artistImg, artistC, albumImg, albumC, category;
  final DateTime release;
  final List<String> genres;
  final bool isFeatured;
  final List<List<String>> people;

  Music({
    this.title,
    this.artist,
    this.album,
    this.label,
    this.description,
    this.artistImg,
    this.artistC,
    this.albumImg,
    this.albumC,
    this.category,
    this.release,
    this.people,
    this.genres,
    this.isFeatured
  });

  String get getCategory {
    return this.category;
  }

  String get getAlbumImg {
    return this.albumImg;
  }

  String get getArtistImg {
    return this.artistImg;
  }

  String get getTitle {
    return this.title;
  }

  String get getAlbum {
    return this.album;
  }

  String get getArtist {
    return this.artist;
  }

  bool get getIsFeatured {
    return this.isFeatured;
  }

  DateTime get getRelease {
    return this.release;
  }

  String get getDesc {
    return this.description;
  }

  List<String> get getGenres {
    return this.genres;
  }

  String get getLabel {
    return this.label;
  }

  String get getArtistC {
    return this.artistC;
  }

  String get getAlbumC {
    return this.albumC;
  }

  // List<List<String>> get getPeople {
  //   return this.people;
  // }

  List<List<String>> getPeople() {
    List<List<String>> list = new List();
    list.addAll(this.people);
    list.insert(0, [this.artist, "Artist", this.artistImg, this.artistC]);
    return list;
  }


  Map<String, String> getCredits() {
    Map<String, String> map = new Map();
    map.addAll({"Label: " : this.label, "Album: " : this.albumC});
    List<List<String>> people = this.getPeople();
    for (int i = 0; i < people.length; i++) {
      if (people[i][3] != null) {
        List<String> vals = map.values.toList();
        for (int j = 0; j < vals.length; j++) {
          if (people[i][3].compareTo(vals[j]) == 0) {
            people[i][3] = "Same as " + people[j][3];
          }
        }
        map.addAll({people[i][1] + ": " : people[i][3]});
      }
    }
    return map;
  }

}

List<Music> songs = [
  //Prom Night: 0
  Music(
    title: "Prom Night",
    artist: "Chance the Rapper",
    album: "10 Day",
    label: "N/A",
    release: DateTime(2012, 4, 3),
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc faucibus a pellentesque sit amet porttitor eget. Consectetur a erat nam at lectus urna duis convallis convallis. Sed vulputate mi sit amet mauris commodo quis imperdiet massa. Sed risus pretium quam vulputate dignissim suspendisse in est. In fermentum et sollicitudin ac orci phasellus egestas. Amet nulla facilisi morbi tempus iaculis urna id volutpat lacus. Nunc sed id semper risus in hendrerit gravida rutrum quisque. Ullamcorper dignissim cras tincidunt lobortis feugiat vivamus at. Sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit. Arcu non sodales neque sodales ut. Tristique sollicitudin nibh sit amet commodo nulla facilisi nullam. Sollicitudin aliquam ultrices sagittis orci a scelerisque purus semper. Massa id neque aliquam vestibulum morbi blandit cursus risus. Phasellus faucibus scelerisque eleifend donec pretium vulputate sapien. Rutrum quisque non tellus orci. Lacus suspendisse faucibus interdum posuere lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc faucibus a pellentesque sit amet porttitor eget. Consectetur a erat nam at lectus urna duis convallis convallis. Sed vulputate mi sit amet mauris commodo quis imperdiet massa. Sed risus pretium quam vulputate dignissim suspendisse in est. In fermentum et sollicitudin ac orci phasellus egestas. Amet nulla facilisi morbi tempus iaculis urna id volutpat lacus. Nunc sed id semper risus in hendrerit gravida rutrum quisque. Ullamcorper dignissim cras tincidunt lobortis feugiat vivamus at. Sed vulputate odio ut enim blandit volutpat maecenas volutpat blandit. Arcu non sodales neque sodales ut. Tristique sollicitudin nibh sit amet commodo nulla facilisi nullam. Sollicitudin aliquam ultrices sagittis orci a scelerisque purus semper. Massa id neque aliquam vestibulum morbi blandit cursus risus. Phasellus faucibus scelerisque eleifend donec pretium vulputate sapien. Rutrum quisque non tellus orci. Lacus suspendisse faucibus interdum posuere lorem ipsum dolor sit amet.",
    //artistImg: "https://upload.wikimedia.org/wikipedia/commons/0/03/Chance_the_Rapper_2018_February.png",
    artistImg: "chance.png",
    artistC: "FOX Sports: https://www.youtube.com/watch?v=YT86shZnD38, CC BY 3.0, https://commons.wikimedia.org/w/index.php?curid=72191644",
    //albumImg: "https://upload.wikimedia.org/wikipedia/en/1/11/Chance10Day.jpeg",
    albumImg: "10DayTape.jpeg",
    albumC: "Fair use: https://en.wikipedia.org/w/index.php?curid=50047311",
    category: "Old Beats",
    people: [["test", "Writer", "empty.png", null]],
    genres: ["rap", "r&b"],
    isFeatured: true,
  ),
  //I Wanna Get Better: 1
  Music(
    title: "I Wanna Get Better",
    artist: "Bleachers",
    album: "Strange Desire",
    label: "RCA Records",
    release: DateTime(2014, 2, 18),
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc faucibus a pellentesque sit amet porttitor eget. Consectetur a erat nam at lectus urna duis convallis convallis.",
    artistImg: "bleachers.png",
    artistC: "By Katie Fricker - Jack Antonoff, CC BY 2.0, https://commons.wikimedia.org/w/index.php?curid=57757654",
    albumImg: "StrangeDesire.jpg",
    albumC: "Fair use",
    category: "Never Gets Old",
    people: [[]],
    genres: ["indie", "electronic", "energetic"],
    isFeatured: true,
  ),
  //Crash My Car: 2
];
