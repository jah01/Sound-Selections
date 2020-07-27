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
    description: "Chance the Rapper's first tape, 10 Day, includes a light tune about a night he admits he never experienced. Sampling Brenda Russell's So Good, So Right (1979), Chance raps about graduation, growing up, and of course, prom night. At the end of the song, he pulls the rug from under your feet, and the beautiful metaphors of royalty and the Grammys disappear as he explains he missed prom, and adds that he would do it again if given the chance. This is one of my favorite Chance songs not only because the melody favors Russell's piano over the all-too-common bass in raps, but also because of the unique echo-y lines that give the first verse some energy to set the stage for a memorable song.",
    //artistImg: "https://upload.wikimedia.org/wikipedia/commons/0/03/Chance_the_Rapper_2018_February.png",
    artistImg: "chance.png",
    artistC: "FOX Sports: https://www.youtube.com/watch?v=YT86shZnD38, CC BY 3.0, https://commons.wikimedia.org/w/index.php?curid=72191644.",
    //albumImg: "https://upload.wikimedia.org/wikipedia/en/1/11/Chance10Day.jpeg",
    albumImg: "10DayTape.jpeg",
    albumC: "Fair use: https://en.wikipedia.org/w/index.php?curid=50047311.",
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
    artistC: "By Katie Fricker - Jack Antonoff, CC BY 2.0, https://commons.wikimedia.org/w/index.php?curid=57757654.",
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
    albumC: "Fair use: album cover art accompanies the post’s commentary about the song.",
    category: "April 2020",
    people: [["Paul Klein (of LANY)", "Writer", "paulKlein.png", "Fair use"], ["Ryan Tedder", "Writer", "ryanTedder.png", "This file is made available under the Creative Commons CC0 1.0 Universal Public Domain Dedication."]],
    genres: ["electronic", "indie pop"],
    isFeatured: false,
    artistRole: "Artist",
  ),
  //Youuu: 4
  Music(
    title: "Youuu",
    artist: "COIN",
    album: "Dreamland",
    label: "The Committee for Sound and Mind",
    release: DateTime(2020, 1, 16),
    description: "In this catchy, synth pop song, COIN talks about a finished relation where he \"slow dances with a stranger\" to \"kiss the heartbreak\" off his lips, but unfortunately, he's still thinking about, well, youuu. The instrumental is amazing and the song sounds truly wonderful with all the busy electronic additions, especially towards the end when lead singer Chase gets into it.",
    artistImg: "coin.png",
    artistC: "Fair use",
    albumImg: "Dreamland.jpg",
    albumC: "Fair use",
    category: "April 2020",
    people: [],
    genres: ["energetic", "electronic", "indie pop"],
    isFeatured: false,
    artistRole: "Artist/Writers",
  ),
  //Heartlines: 5
  Music(
    title: "Heartlines",
    artist: "Broods",
    album: "Conscious",
    label: "Capitol, Island, and Universal",
    release: DateTime(2016, 6, 9),
    description: "Heartlines, appearing on Broods's second album, is a piece with an eerie electronic tune that flows through the sounds of the drums and bass, creating the perfect contrast to vocalist Georgia Nott's soprano voice. It's one of the more popular songs from Conscious, and it's easy to see why. The build-up of the song is slow and not super powerful, but it delivers the quintessential Broods sound that carries into their later album, Don't Feed The Pop Monster.",
    artistImg: "broods.jpg",
    artistC: "Fair use",
    albumImg: "conscious.jpg",
    albumC: "Fair use",
    category: "April 2020",
    people: [["Joel Little", "Writer/Producer", "joelLittle.png", "Fair use"], ["Lorde", "Writer", "lorde.png", "This file is licensed under the Creative Commons Attribution 2.0 Generic license."]],
    genres: ["electronic", "indie pop"],
    isFeatured: false,
    artistRole: "Artist/Writers",
  ),
  //Rollercoaster: 6
  Music(
    title: "Rollercoaster",
    artist: "Bleachers",
    album: "Strange Desire",
    label: "RCA Records",
    release: DateTime(2014, 7, 11),
    description: "Jack Antonoff of Bleachers outdoes himself again with Rollercoaster, a song of a relationship that was, believe it or not, a rollercoaster. The crazy, fun, dangerous, and beautiful emotions expressed through Antonoff's vocals and the accompanying sounds drives a lively tune that beckons to be sung out loud.",
    artistImg: "bleachers.png",
    artistC: "By Katie Fricker - Jack Antonoff, CC BY 2.0, https://commons.wikimedia.org/w/index.php?curid=57757654.",
    albumImg: "StrangeDesire.jpg",
    albumC: "Fair use",
    category: "April 2020",
    people: [["John Hill", "Writer/Producer", "johnHill.jfif", "Fair use"], ["Greg Kurstin", "Producer", "gregKurstin.png", "This file is licensed under the Creative Commons Attribution-Share Alike 3.0 Unported license."]],
    genres: ["energetic", "electronic"],
    isFeatured: false,
    artistRole: "Artist/Writer/Producer",
  ),
  //Admit Defeat: 7
  Music(
    title: "Admit Defeat",
    artist: "Bastille",
    album: "Doom Days (This Got Out Of Hand Edition)",
    label: "Universal Music Group",
    release: DateTime(2019, 12, 6),
    description: "The first new addition to Bastille's extended edition album, Admit Defeat is your typical Bastille jam. That is to say it's full of background harmonies that perfectly complement the melody as well as Dan Smith's voice. The song goes into the mind of a person who met someone who \"stirred something\" in him as he begs her to \"wrap [herself] around\" him. He desires to be with her for more than just one night, as his mind surrenders to thoughts of only her.",
    artistImg: "bastille.png",
    artistC: "Fair use",
    albumImg: "doomDaysExtended.jpg",
    albumC: "Fair use",
    category: "April 2020",
    people: [["Dan Smith (of Bastille)", "Writer/Producer", "danSmith.png", "This file is licensed under the Creative Commons Attribution-Share Alike 3.0 Unported license."], ["Kyle Simmons (of Bastille)", "Producer", "kyleSimmons.jpg", "Fair use"], ["Mark Crew", "Producer", "empty.png", null]],
    genres: ["energetic", "electronic", "rock"],
    isFeatured: false,
    artistRole: "Artist",
  ),
  //I Lost a Friend: 8
  Music(
    title: "I Lost a Friend",
    artist: "FINNEAS",
    album: "Blood Harmony",
    label: "OYOY, AWAL",
    release: DateTime(2019, 5, 3),
    description: "Finneas crafts a wonderful marriage of deep lyrics and excellent execution of the right amount of piano, bass, and synth in his hit I Lost a Friend. The title is pretty self-explanatory, but the song dives deep into the feeling of no longer having a person in your life. My favorite part is when the bass and synth kick in towards the end, and there's really no part of the song that needs any more or any less of something; it just sounds right.",
    artistImg: "finneas.png",
    artistC: "This file is licensed under the Creative Commons Attribution-Share Alike 4.0 International license. Attribution :  © Glenn Francis, www.PacificProDigital.com.",
    albumImg: "bloodHarmony.png",
    albumC: "Fair use: album cover art accompanies the post’s commentary about the song.",
    category: "April 2020",
    people: [],
    genres: ["sad", "piano"],
    isFeatured: true,
    artistRole: "Artist/Writer/Producer",
  ),
  //June: 9
  Music(
    title: "June",
    artist: "John Chuck & the Class",
    album: "June",
    label: "N/A",
    release: DateTime(2019, 5, 31),
    description: "June is a fun ride full of odd mechanics and beautiful sound. A bouncy beat introduces us to an exciting story of what's going down in June. Featuring Dwynell Roland and Denny, the song combines rap, passionate chorus, and shifts of tempo and volume. Be sure not to miss the dramatic build-up that concludes this single.",
    artistImg: "jcatc.png",
    artistC: "Fair use",
    albumImg: "june.jpg",
    albumC: "Fair use",
    category: "Summer 2020",
    people: [["Dwynell Roland", "Featured", "dwynellRoland.png", "Fair use"], ["Denny", "Featured", "denny.png", "Fair use"]],
    genres: ["rap", "indie"],
    isFeatured: true,
    artistRole: "Artist/Producer",
  ),
  //Cheap Sunglasses: 10
  Music(
    title: "Cheap Sunglasses",
    artist: "RAC",
    album: "Strangers",
    label: "Universal Music Group",
    release: DateTime(2014, 4, 1),
    description: "This fun song featuring Matthew Koma is about someone who acts fake: \"Your limousines get stuck in traffic / And we all know you're made of plastic,\" Koma sings. Despite the topic of the song, it feels very lighthearted and sounds refreshing.",
    artistImg: "rac.jpg",
    artistC: "Fair use",
    albumImg: "strangers.jpg",
    albumC: "Fair use",
    category: "Summer 2020",
    people: [["Matthew Koma", "Featured/Writer", "matthewKoma.png", "This file is licensed under the Creative Commons Attribution-Share Alike 2.0 Generic license."]],
    genres: ["indie pop", "electronic", "energetic"],
    isFeatured: false,
    artistRole: "Artist/Writer/Producer",
  ),
  //24hrs: 11
  Music(
    title: "24hrs",
    artist: "ill Nicky",
    album: "24hrs",
    label: "ill Music Group thru United Masters",
    release: DateTime(2020, 3, 20),
    description: "Since the beginning verse, 24hrs grabs your attention. This isn't your typical \"grind\" or \"hustle\" song, but it's not lacking in those themes. Instead, it is a refreshing piece of music that utilizes some fun and necessary background vocals and hints of synth. The tempo is quick, the message is uplifting, and the execution is fantastic.",
    artistImg: "illNicky.png",
    artistC: "Fair use",
    albumImg: "24hrs.jpg",
    albumC: "Fair use",
    category: "Summer 2020",
    people: [["Will Saulsky", "Producer", "willSaulsky.png", "Fair use"]],
    genres: ["hip-hop", "energetic"],
    isFeatured: false,
    artistRole: "Artist/Writer",
  ),
  //Sucker: 12
  Music(
    title: "Sucker",
    artist: "Broods",
    album: "Don't Feed The Pop Monster",
    label: "Neon Gold, Island, UMA",
    release: DateTime(2019, 2, 1),
    description: "Coupled with exceptional drums and hints of synth, Broods delivers a brilliant message of a somewhat-crippled self-awareness in which one \"Almost lost [themselves] just trying / To be like somebody else\" as they try to navigate the social complications in life. If you enjoy this song, be sure to check out the rest of the album, such as the popular Peach or perhaps Everything Goes (Wow).",
    artistImg: "broods.jpg",
    artistC: "Fair use",
    albumImg: "dftpm.png",
    albumC: "Fair use: album cover art accompanies the post’s commentary about the song.",
    category: "Summer 2020",
    people: [["Tommy English", "Writer/Producer", "tommyEnglish.png", "Fair use"]],
    genres: ["electronic", "energetic", "pop rock"],
    isFeatured: false,
    artistRole: "Artist/Writers",
  ),
  //Talk Nice: 13
  Music(
    title: "Talk Nice",
    artist: "No Rome",
    album: "Talk Nice",
    label: "Dirty Hit",
    release: DateTime(2019, 10, 4),
    description: "No Rome comes at us with a song about money and how it affects a relationship. With lines that support both the perpetual need for wealth and \"money isn't everything,\" it's sure to leave you wondering if money is most important in a relationship or life in general.",
    artistImg: "noRome.png",
    artistC: "Fair use",
    albumImg: "talkNice.jpg",
    albumC: "Fair use",
    category: "Summer 2020",
    people: [["Jonathan Gilmore", "Producer", "empty.png", null]],
    genres: ["electronic", "indie pop"],
    isFeatured: false,
    artistRole: "Artist/Writer/Producer",
  ),
  //Be My Mistake: 14
  Music(
    title: "Be My Mistake",
    artist: "The 1975",
    album: "A Brief Inquiry Into Online Relationships",
    label: "Dirty Hit, Polydor Records, and Interscope Records",
    release: DateTime(2018, 11, 30),
    description: "Be My Mistake is a soft ballad about a hookup. The song comes with a slow tempo, sad voice, and overall just a mood of future regret. It's a great song to listen to for relaxing or just changing over to something a little more simple and calm.",
    artistImg: "the1975.png",
    artistC: "Fair use",
    albumImg: "abiior.jpg",
    albumC: "Fair use",
    category: "Summer 2020",
    people: [["Matty Healy (of The 1975)", "Writer/Producer", "mattyHealy.png", "Fair use"], ["George Daniel (of The 1975)", "Writer/Producer", "georgeDaniel.png", "Fair use"]],
    genres: ["ballad", "sad"],
    isFeatured: false,
    artistRole: "Artist/Writers/Producers",
  ),
  //Narcissist: 15
  Music(
    title: "Narcissist",
    artist: "No Rome",
    album: "RIP Indo Hisashi",
    label: "Dirty Hit",
    release: DateTime(2018, 8, 28),
    description: "From the first verse to the outro, Narcissist is an incredibly fun tune about infidelity. The lyrics are almost as catchy as the beat, and Matty Healy of The 1975 even asked if he could be featured.",
    artistImg: "noRome.png",
    artistC: "Fair use",
    albumImg: "rip.jpg",
    albumC: "Fair use",
    category: "Late 2019",
    people: [["The 1975", "Featured", "the1975.png", "Fair use"], ["Matty Healy (of The 1975)", "Writer/Producer", "mattyHealy.png", "Fair use"], ["George Daniel (of The 1975)", "Producer", "georgeDaniel.png", "Fair use"]],
    genres: ["energetic", "indie pop", "sampling"],
    isFeatured: true,
    artistRole: "Artist/Writer/Producer",
  ),
];
