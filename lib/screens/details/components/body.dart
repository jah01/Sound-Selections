import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    //TODO people
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
                      height: 175,
                      color: Colors.white,
                      padding: EdgeInsets.all(defaultPadding),
                      alignment: Alignment.topLeft,
                     child: ListView.builder(
                       scrollDirection: Axis.horizontal,
                       itemCount: people.length,
                       //TODO people
                       itemBuilder: (context, index) {
                         //bool isArtist = index == 0;
                         //print("ARTIST----------------------------------- " + people.keys.elementAt(index).toString());
                         return Container(
                           margin: EdgeInsets.symmetric(horizontal: defaultPadding),
                           width: 80,
                           child: Column(
                             children: <Widget>[
                               Container(
                                 height: 80,
                                 decoration: BoxDecoration(
                                   shape: BoxShape.circle,
                                   //TODO make a map
                                   //image: isArtist ? DecorationImage(image: AssetImage("assets/images/" + song.getArtistImg), fit: BoxFit.fill) : DecorationImage(image: AssetImage("assets/images/empty.png"), fit: BoxFit.fill),
                                   image: DecorationImage(image: AssetImage("assets/images/" + people[index][2]), fit: BoxFit.fill),
                                 ),

                                 //color: Colors.grey,
                               ),
                               Container(height: 10, color: Colors.white,),
                               Text(
                                 people[index][0],
                                 //people.keys.elementAt(index),
                                 //TODO people
                                 textAlign: TextAlign.center,
                                 style: TextStyle(fontSize: 14, color: Colors.grey[600], fontWeight: FontWeight.w600),
                                 maxLines: 2,
                               ),
                               Container(height: 5, color: Colors.white,),
                               Text(
                                 people[index][1],
                                 //people.values.elementAt(index),
                                 //TODO people
                                 maxLines: 1,
                                 textAlign: TextAlign.center,
                                 style: TextStyle(fontSize: 14, color: Colors.grey[400], fontWeight: FontWeight.w600),
                               ),
                             ],
                           ),
                         );
                       },
                     ),
                    ),
                    Container(
                      color: Colors.white,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(defaultPadding, 0.0, defaultPadding, 6.0),
                      child: Text("Additional Information", style: TextStyle(fontSize: 24, color: thirdColor, fontWeight: FontWeight.w600),),
                    ),
                    Container(
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
                      // child: ListView.builder(
                      //   itemCount: credits.length,
                      //   itemBuilder: (context, i) {
                      //     String currKey = credits.keys.elementAt(i);
                      //     String currVal = credits.values.elementAt(i);
                          // return RichText(
                          //       textAlign: TextAlign.left,
                          //       text: TextSpan(
                          //         text: currKey,
                          //         style: TextStyle(fontSize: 12, color: Colors.grey[600], fontWeight: FontWeight.w600),
                          //         children: <TextSpan>[
                          //           TextSpan(text: currVal, style: TextStyle(color: Colors.grey[400])),
                          //         ],
                          //       ),
                          // );
                      //   }
                      // ),





                      //  child: RichText(
                      //   textAlign: TextAlign.left,
                      //   text: TextSpan(
                      //     text: "Label: ",
                      //     style: TextStyle(fontSize: 12, color: Colors.grey[600], fontWeight: FontWeight.w600),
                      //     children: <TextSpan>[
                      //       TextSpan(text: "${song.getLabel}\n", style: TextStyle(color: Colors.grey[400])),
                      //     ],
                      //   ),
                      //  ),




                      // child: RichText(
                      //   textAlign: TextAlign.left,
                      //   text: TextSpan(
                      //     text: "Label: ",
                      //     style: TextStyle(fontSize: 12, color: Colors.grey[600], fontWeight: FontWeight.w600),
                      //     children: <TextSpan>[
                      //       TextSpan(text: "${song.getLabel}\n", style: TextStyle(color: Colors.grey[400])),
                      //       TextSpan(text: "Artist Image Copyright: ",
                      //         children: <TextSpan>[
                      //           TextSpan(text: "${song.getArtistC}\n", style: TextStyle(color: Colors.grey[400])),
                      //           TextSpan(text: "Album Image Copyright: ",
                      //             children: <TextSpan>[
                      //               TextSpan(text: "${song.getAlbumC}", style: TextStyle(color: Colors.grey[400])),
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: defaultPadding),),
                  ],
                ),
              ),
//              Padding(padding: EdgeInsets.only(bottom: 6.0),),
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
