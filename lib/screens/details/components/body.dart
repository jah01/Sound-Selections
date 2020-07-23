import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soundselections/defaults.dart';
import '../../details/details_screen.dart';
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
    Map<String, String> people = song.getPeople();
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
                      Colors.white.withOpacity(0.0),
                      Colors.white.withOpacity(0.5),
                      Colors.white,
                    ],
                    stops: [0, .5, .7, .85],
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
                color: Colors.white,
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(defaultPadding, defaultPadding, defaultPadding, 6.0),
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
                padding: EdgeInsets.fromLTRB(defaultPadding, defaultPadding, defaultPadding, 6.0),
                child: Text("People", style: TextStyle(fontSize: 24, color: thirdColor, fontWeight: FontWeight.w600),),
              ),
              Container(
                height: 160,
                color: Colors.white,
                padding: EdgeInsets.all(defaultPadding),
                alignment: Alignment.topLeft,
                child: ListView.separated(
                  separatorBuilder:
                      (BuildContext context, int index) => dividerVertical,
                  scrollDirection: Axis.horizontal,
                  itemCount: people.length,
                  itemBuilder: (context, index) {
                    //print("ARTIST----------------------------------- " + people.keys.elementAt(index).toString());
                    return Container(
                      //padding: EdgeInsets.only(right: defaultPadding),
                      width: 80,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 80,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(image: AssetImage("assets/images/" + song.getAlbumImg), fit: BoxFit.fill),
                            ),
                            //color: Colors.grey,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          ),
        ],
      ),
    ),);
  }
}
