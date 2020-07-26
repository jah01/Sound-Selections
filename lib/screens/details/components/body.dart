import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:soundselections/defaults.dart';
import '../../../data/music.dart';

Widget _flightShuttleBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
    ) {
  return DefaultTextStyle(
    style: DefaultTextStyle.of(toHeroContext).style,
    child: toHeroContext.widget,
  );
}

class Body extends StatelessWidget {
  final Music song;
  final Key k;

  Body(this.song, this.k);

  //const Body({Key key, this.song}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<List<String>> people = song.getPeople();
    Map<String, String> credits = song.getCredits();
    return Hero(tag: k, flightShuttleBuilder: _flightShuttleBuilder, transitionOnUserGestures: true, child:Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
      Container(
            width: MediaQuery.of(context).size.width,
//            foregroundDecoration: new BoxDecoration(
//              gradient: new LinearGradient(
//                begin: Alignment.topCenter,
//                end: Alignment.bottomCenter,
//                colors: [
//                  Colors.white.withOpacity(0.0),
//                  Colors.white,
//                ],
//                stops: [.5, .8],
//              ),
//            ),
            child: FittedBox(
              child: Image.asset("assets/images/" + song.getAlbumImg),
              fit: BoxFit.fill,
            ),
          ),
          SingleChildScrollView(child: Column(

            children: <Widget>[
//              Container(
//                height: MediaQuery.of(context).size.width * .4,
//              ),
              Container(
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0.0),
                      Colors.white.withOpacity(0.2),
                      //Colors.white.withOpacity(0.5),
                      Colors.white,
                    ],
                    stops: [0, .5, .85],
                  ),
                ),
                alignment: Alignment.centerLeft,
                height: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(song.getTitle, style: TextStyle(fontSize: 24, color: Colors.grey[800], fontWeight: FontWeight.w600),),
                    //Text(song.getTitle, style: TextStyle(fontSize: 24, color: thirdColor, fontWeight: FontWeight.w600),),
                    Wrap(
                      children: <Widget>[
                        Text("by ${song.getArtist}", style: TextStyle(fontSize: 16, color: Colors.grey[600], fontWeight: FontWeight.w600),),
                        Container(padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2), child: Text("•", style: TextStyle(fontSize: 16, color: Colors.grey[600], fontWeight: FontWeight.w600),),),
                        Text("on ${song.getAlbum}", style: TextStyle(fontSize: 16, color: Colors.grey[600], fontWeight: FontWeight.w600),),
                        Container(padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2), child: Text("•", style: TextStyle(fontSize: 16, color: Colors.grey[600], fontWeight: FontWeight.w600),),),
                        Text(song.getRelease.year.toString(), style: TextStyle(fontSize: 16, color: Colors.grey[600], fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(0.0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(defaultPadding, defaultPadding, defaultPadding, 6.0),
                      child: Text("Genres", style: TextStyle(fontSize: 24, color: thirdColor, fontWeight: FontWeight.w600),),
                    ),
                    //Container(color: Colors.white, padding: EdgeInsets.only(top: defaultPadding),),
                    Container(
                      height: 32,
                      color: Colors.white,
                      //color: Colors.grey,
                      margin: EdgeInsets.symmetric(horizontal: defaultPadding * 2),
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (BuildContext context, int index) => dividerVerticalSmall,
                          itemCount: song.getGenres.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 32,
                              alignment: Alignment.center,
                              //margin: EdgeInsets.only(left: defaultPadding),
                              padding: EdgeInsets.symmetric(
                                horizontal: defaultPadding,
                                vertical: 0,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[600], width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                song.getGenres[index],
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey[600]), textAlign: TextAlign.justify,
                              ),
                            );
                          }
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(defaultPadding, defaultPadding, defaultPadding, 8.0),
                      child: Text("Review", style: TextStyle(fontSize: 24, color: thirdColor, fontWeight: FontWeight.w600),),
                    ),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: defaultPadding * 2),
                      alignment: Alignment.topLeft,
                      child: Text(song.getDesc, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey[400]), textAlign: TextAlign.justify,),
                    ),
                    Container(
                      color: Colors.white,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(defaultPadding, defaultPadding, defaultPadding, 8.0),
                      child: Text("People", style: TextStyle(fontSize: 24, color: thirdColor, fontWeight: FontWeight.w600),),
                    ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: defaultPadding * 2),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        for (var i in people) peopleCard(people, i),
                      ],
                    ),
                  ),
                ),
                    Container(
                      color: Colors.white,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(defaultPadding, defaultPadding, defaultPadding, 8.0),
                      child: Text("Additional Information", style: TextStyle(fontSize: 24, color: thirdColor, fontWeight: FontWeight.w600),),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: defaultPadding * 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          for (int i = 0; i < credits.length; i++) RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                  text: credits.keys.elementAt(i),
                                  style: TextStyle(fontSize: 12, color: Colors.grey[600], fontWeight: FontWeight.w600),
                                  children: <TextSpan>[
                                    TextSpan(text: credits.values.elementAt(i), style: TextStyle(color: Colors.grey[400])),
                                  ],
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: defaultPadding),),
                  ],
                ),
              ),
            ],
          ),
          ),
          Material(color: Colors.transparent, child: SafeArea(
            child: Container(
              margin: EdgeInsets.only(left: 6.0, top: 6.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  new BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4.0,
                    offset: Offset(0.0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                ),
                iconSize: 20,
                color: thirdColor,
                splashColor: Colors.transparent,
                //hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),),
        ],
      ),
    ),);
  }
}

Widget peopleCard(List<List<String>> people, List<String> person) {
  bool isLast = people[people.length - 1] == person;
  return Container(
    color: Colors.white,
    margin: isLast ? EdgeInsets.all(0.0) : EdgeInsets.only(right: defaultPadding * 2),
    width: 100,
    child: Column(
      children: <Widget>[
        Container(
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage("assets/images/" + person[2]), fit: BoxFit.fill),
          ),
        ),
        Container(height: 10, color: Colors.white,),
        Text(
          person[0],
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: Colors.grey[600], fontWeight: FontWeight.w600),
          maxLines: 2,
        ),
        Container(height: 5, color: Colors.white,),
        AutoSizeText(
          person[1],
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: Colors.grey[400], fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}
