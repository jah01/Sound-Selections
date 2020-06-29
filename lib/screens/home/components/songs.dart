import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../data/music.dart';
import '../../../defaults.dart';

void v() {
  print(songs);
}

List<String> albums;
//void populateAlbums() {
//  albums = new List();
//  for (int i = 0; i < songs.length; i++) {
//    albums.add(songs[i].getAlbumImg);
//  }
//  print(albums);
//}
void populateAlbums() {
  albums = new List();
  albums.add(
      "https://upload.wikimedia.org/wikipedia/en/1/11/Chance10Day.jpeg");
  albums.add(
      "https://upload.wikimedia.org/wikipedia/commons/0/03/Chance_the_Rapper_2018_February.png");
//  for (int i = 0; i < songs.length; i++) {
//    albums.add(
//        "https://upload.wikimedia.org/wikipedia/en/1/11/Chance10Day.jpeg");
//  }
}


final List<Widget> images = albums.map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(item, fit: BoxFit.cover, width: 1000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text(
                  'No. ${albums.indexOf(item)} image',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )
    ),
  ),
)).toList();

class SongList1 extends StatefulWidget {
  @override
  _SongList1 createState() => _SongList1();
}

class _SongList1 extends State<SongList1> {
  PageController _pageController;
  //int initialPage = 0;

//  @override
//  void initState() {
//    super.initState();
//    _pageController = PageController(
//      viewportFraction: .8,
//      initialPage: initialPage
//    );
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//    _pageController.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    populateAlbums();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: defaultPadding),
      child: Container(child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          initialPage: 0,
          autoPlay: false,
        ),
        items: images,
      ),),
    );
  }
}

//child: AspectRatio(
//aspectRatio: .85,
//PageView.builder(
//onPageChanged: (value) {
//setState(() {
//initialPage = value;
//});
//},
//controller: _pageController,
//physics: ClampingScrollPhysics(),
//itemCount: songs.length,
//itemBuilder: (context, i) {
//return AnimatedBuilder(
//animation: _pageController,
//builder: (context, album),
//);
//},
//),

//class SongList extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    populateAlbums();
//      return  Container(
//            child: CarouselSlider(
//              options: CarouselOptions(
//                aspectRatio: 2.0,
//                enlargeCenterPage: true,
//                enableInfiniteScroll: false,
//                initialPage: 0,
//                autoPlay: false,
//              ),
//              items: images,
//            )
//      );
//  }
//}





//class SongList extends StatefulWidget {
//  SongList(this.index);
//  int index;
//
//  @override
//  _SongList createState() => _SongList(index);
//}
//
//class _SongList extends State<SongList> {
//  int selectedIndex;
//  _SongList(this.selectedIndex);
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      height: 200,
//      width: 200,
//      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
//      child: GestureDetector(
//        onTap: () {
//          setState(() {
//            selectedIndex = i;
//          });
//        },
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Container(
//
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
