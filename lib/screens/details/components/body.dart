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
                padding: EdgeInsets.all(defaultPadding),
                alignment: Alignment.topLeft,
                child: Text(song.getDesc, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.grey[400]),),
              ),
            ],
          ),
          ),
        ],
      ),
    ),);
  }
}
