import 'package:flutter/cupertino.dart';

class Music {
  final String title, author, album, label, description, authorImg, authorC, imageC;
  final DateTime release;
  final List<String> genre, writer, producer;
  final Image albumImg;

  Image get getAlbumImg {
    return albumImg;
  }

  Music(
    this.title,
    this.author,
    this.authorImg,
    this.authorC,
    this.album,
    this.albumImg,
    this.imageC,
    this.release,
    this.label,
    this.description,
    this.genre,
    [this.writer,
    this.producer]
  );

}

List<Music> songs = [
  //Prom Night: 0
  Music(
      "Prom Night",
      "Chance the Rapper",
      "chance.png",
      "FOX Sports: https://www.youtube.com/watch?v=YT86shZnD38, CC BY 3.0, https://commons.wikimedia.org/w/index.php?curid=72191644",
      "10 Day",
      Image.asset("assets/images/10DayTape.jpeg"),
      "Fair use: https://en.wikipedia.org/w/index.php?curid=50047311",
      DateTime(2012, 4, 3),
      "Independent",
      "desc to be completed later",
      ["Hip-Hop", "R&B", "Rap"]
  ),
  //I Wanna Get Better: 1
  Music(
      "I Wanna Get Better",
      "Chance the Rapper",
      "chance.png",
      "FOX Sports: https://www.youtube.com/watch?v=YT86shZnD38, CC BY 3.0, https://commons.wikimedia.org/w/index.php?curid=72191644",
      "10 Day",
      Image.asset("assets/images/10DayTape.jpeg"),
      "Fair use: https://en.wikipedia.org/w/index.php?curid=50047311",
      DateTime(2012, 4, 3),
      "Independent",
      "desc to be completed later",
      ["Hip-Hop", "R&B", "Rap"]
  ),
  //Crash My Car
  Music(
      "Crash My Car",
      "Chance the Rapper",
      "chance.png",
      "FOX Sports: https://www.youtube.com/watch?v=YT86shZnD38, CC BY 3.0, https://commons.wikimedia.org/w/index.php?curid=72191644",
      "10 Day",
      Image.asset("assets/images/10DayTape.jpeg"),
      "Fair use: https://en.wikipedia.org/w/index.php?curid=50047311",
      DateTime(2012, 4, 3),
      "Independent",
      "desc to be completed later",
      ["Hip-Hop", "R&B", "Rap"]
  ),


];