import 'package:intl/intl.dart';

DateFormat dateFormat = DateFormat("MMMM d, yyyy");

class Music {
  final String title, artist, album, label, description, artistImg, artistC, albumImg, albumC, category, artistRole;
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
    this.isFeatured,
    this.artistRole
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
    list.insert(0, [this.artist, this.artistRole, this.artistImg, this.artistC]);
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
    description: "Chance the Rapper's first tape, 10 Day, includes a light tune about a night he admits he never experienced. Sampling Brenda Russell's So Good, So Right (1979), Chance raps about graduation, growing up, and of course, prom night. At the end of the song, he pulls the rug from under your feet, and the beautiful methaphores of royalty and the Grammys disappear as he explains he missed prom, and adds that he would do it again if given the chance. This is one of my favorite Chance songs not only because the melody favors Russell's piano over the all-too-common bass in raps, but also because of the unique echo-y lines that give the first verse some energy to set the stage for a memorable song.",
    //artistImg: "https://upload.wikimedia.org/wikipedia/commons/0/03/Chance_the_Rapper_2018_February.png",
    artistImg: "chance.png",
    artistC: "FOX Sports: https://www.youtube.com/watch?v=YT86shZnD38, CC BY 3.0, https://commons.wikimedia.org/w/index.php?curid=72191644",
    //albumImg: "https://upload.wikimedia.org/wikipedia/en/1/11/Chance10Day.jpeg",
    albumImg: "10DayTape.jpeg",
    albumC: "Fair use: https://en.wikipedia.org/w/index.php?curid=50047311",
    category: "Summer 2020",
    people: [["Brenda Russell", "Sampled", "brendarussell.jpg", "Public image"]],
    genres: ["rap", "sampling"],
    isFeatured: true,
    artistRole: "Artist/Writer",
  ),
  //I Wanna Get Better: 1
  Music(
    title: "I Wanna Get Better",
    artist: "Bleachers",
    album: "Strange Desire",
    label: "RCA Records",
    release: DateTime(2014, 2, 18),
    description: "Originally released as Jack Antonoff's debut single and later incorporated into his debut studio album, I Wanna Get Better is an incredible collaboration of a pounding, cathartic melody with a heavy message of growing up and dealing with the struggles of life (and death). Still one of the most popular songs in Bleacher's impressive repertoire, IWGB blends emotional vocals, powerful piano, and a meaningful story that sets the stage for Antonoff's later music. If you need one of those car songs or if you like to belt out lyrics, this one's sure to go above and beyond your expectations.",
    artistImg: "bleachers.png",
    artistC: "By Katie Fricker - Jack Antonoff, CC BY 2.0, https://commons.wikimedia.org/w/index.php?curid=57757654",
    albumImg: "StrangeDesire.jpg",
    albumC: "Fair use",
    category: "April 2020",
    people: [["John Hill", "Writer/Producer", "johnHill.jfif", "Fair use"]],
    genres: ["energetic", "electronic", "piano"],
    isFeatured: true,
    artistRole: "Artist/Writer/Producer",
  ),
  //Crash My Car: 2
  Music(
    title: "Crash My Car",
    artist: "COIN",
    album: "Dreamland",
    label: "The Committee for Sound and Mind",
    release: DateTime(2019, 6, 13),
    description: "COIN's second album is full of fun songs, and Crash My Car does not fall far from your high-energy favorites. Best sung with others, this song boasts a bouncy rhythm, loud (and sometimes sobering) lyrics, and multiple tempo changes.",
    artistImg: "coin.png",
    artistC: "Fair use",
    albumImg: "Dreamland.jpg",
    albumC: "Fair use",
    category: "April 2020",
    people: [["Tommy English", "Writer/Producer", "tommyEnglish.png", "Fair use"]],
    genres: ["energetic", "electronic", "rock", "indie pop"],
    isFeatured: true,
    artistRole: "Artist/Writers",
  ),
  //Super Far: 3
  Music(
    title: "Super Far",
    artist: "LANY",
    album: "LANY",
    label: "Universal Music Group & Polydor Records",
    release: DateTime(2017, 6, 28),
    description: "LANY's first album, by the same name, includes Super Far, a snapping, clapping, and shouting song about breaking up. LANY goes through the emotions of someone who is super far from home (hence the name) as they try to figure out why they are still in a relationship with someone who doesn't care and \"doesn't even try.\" This catchy tune is my favorite from the album, but be sure to check out Thick and Thin by LANY and Mean It by Lauv, the latter LANY is featured in.",
    artistImg: "lany.png",
    artistC: "Fair use",
    albumImg: "lanyAlbum.png",
    albumC: "Fair use: album cover art accompanies the post’s commentary about the song",
    category: "April 2020",
    people: [["Paul Klein (of LANY)", "Writer", "paulKlein.png", "Fair use"], ["Ryan Tedder", "Writer", "ryanTedder.png", "This file is made available under the Creative Commons CC0 1.0 Universal Public Domain Dedication."]],
    genres: ["electronic", "indie pop"],
    isFeatured: false,
    artistRole: "Artist",
  ),
];
