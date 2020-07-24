import 'package:intl/intl.dart';

DateFormat dateFormat = DateFormat("MMMM d, yyyy");

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
    map.addAll({"Label: " : this.label, "Release Date: " : dateFormat.format(this.release), "Album: " : this.albumC});
    List<List<String>> people = this.getPeople();
    for (int i = 0; i < people.length; i++) {
      if (people[i][2] != "empty.png") {
        if (!map.containsKey(people[i][0] + ": ")) {
          map.addAll({people[i][0] + ": " : people[i][3]});
        }
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
    description: "Chance the Rapper's first tape, 10 Day, includes a light tune about a night he admits he never experienced. Sampling Brenda Russell's \"So Good, So Right\" (1979), Chance raps about graduation, growing up, and of course, prom night. At the end of the song, he pulls the rug from under your feet, and the beautiful methaphores of royalty and the Grammys disappear as he explains he missed prom, and adds that he would do it again if given the chance. This is one of my favorite Chance songs not only because the melody favors Russell's piano over the all-too-common bass in raps, but also because of the unique echo-y lines that give the first verse some energy to set the stage for a memorable song.",
    //artistImg: "https://upload.wikimedia.org/wikipedia/commons/0/03/Chance_the_Rapper_2018_February.png",
    artistImg: "chance.png",
    artistC: "FOX Sports: https://www.youtube.com/watch?v=YT86shZnD38, CC BY 3.0, https://commons.wikimedia.org/w/index.php?curid=72191644",
    //albumImg: "https://upload.wikimedia.org/wikipedia/en/1/11/Chance10Day.jpeg",
    albumImg: "10DayTape.jpeg",
    albumC: "Fair use: https://en.wikipedia.org/w/index.php?curid=50047311",
    category: "Summer 2020",
    people: [["Brenda Russell", "Sampled", "empty.png", null]],
    genres: ["rap", "sampling"],
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
    category: "April 2020",
    people: [],
    genres: ["energetic", "electronic", "piano"],
    isFeatured: true,
  ),
  //Crash My Car: 2
  Music(
    title: "Crash My Car",
    artist: "COIN",
    album: "Strange Desire",
    label: "RCA Records",
    release: DateTime(2014, 2, 18),
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc faucibus a pellentesque sit amet porttitor eget. Consectetur a erat nam at lectus urna duis convallis convallis.",
    artistImg: "bleachers.png",
    artistC: "By Katie Fricker - Jack Antonoff, CC BY 2.0, https://commons.wikimedia.org/w/index.php?curid=57757654",
    albumImg: "StrangeDesire.jpg",
    albumC: "Fair use",
    category: "April 2020",
    people: [],
    genres: ["energetic", "electronic", "indie", "piano"],
    isFeatured: true,
  ),
];
