import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_player/res/color.dart';

class NowPlaying extends StatefulWidget {
  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x46000000),
                    offset: Offset(0, 20),
                    spreadRadius: 0,
                    blurRadius: 30,
                  ),
                  BoxShadow(
                    color: Color(0x11000000),
                    offset: Offset(0, 10),
                    spreadRadius: 0,
                    blurRadius: 30,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: AssetImage("assets/images/justine.jpg"),
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.width * 0.6,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Song Name
            Text(
              'Let Me Love You',
              style: TextStyle(
                fontFamily: 'BalooBhaina',
                height: 1,
                fontSize: 24.0,
                letterSpacing: 1.5,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.fade,
              maxLines: 2,
            ),
            // Artist
            Text(
              "DJ Snake ft. Justin Bieber",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'BalooBhaina',
                  color: Colors.grey,
                  fontSize: 20.0,
                  height: 1),
            ),
            SizedBox(
              height: 20,
            ),
            Slider(
              onChanged: (v) {},
              value: 10,
              max: 100,
              min: 0,
              activeColor: Colors.blueGrey[800],
            ),
            /*Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: <Widget>[
                  Text(
                    '00:04',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'BalooBhaina',
                        fontSize: 18,
                        height: 1,
                        fontWeight: FontWeight.w600),
                  ),
                  Expanded(
                    child: Text(
                      '03:25',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'BalooBhaina',
                          fontSize: 18,
                          height: 1,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),*/
            /*SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.backward),
                ),
                IconButton(
                  iconSize: 50,
                  onPressed: () {
                    setState(() {
                      _isPlaying = !_isPlaying;
                    });
                  },
                  icon: Icon(
                    _isPlaying ? FontAwesomeIcons.pause : FontAwesomeIcons.play,
                    color: colorAppOrange,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.forward),
                ),
              ],
            ),*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: <Widget>[
                  Text(
                    '00:04',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'BalooBhaina',
                        fontSize: 18,
                        height: 1,
                        fontWeight: FontWeight.w600),
                  ),
                  Expanded(
                    child: Text(
                      '03:25',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'BalooBhaina',
                          fontSize: 18,
                          height: 1,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  child: Icon(Icons.skip_previous,
                      size: MediaQuery.of(context).size.width * 0.15,
                      color: Colors.blueGrey[800]),
                  // onTap: () => prevSong()
                ),
                InkWell(
                  child: Icon(
                    Icons.play_circle_filled,
                    size: MediaQuery.of(context).size.width * 0.22,
                    color: Colors.blueGrey[800],
                  ),
                  // onTap: ()=>toggle()
                ),
                InkWell(
                  child: Icon(
                    Icons.skip_next,
                    size: MediaQuery.of(context).size.width * 0.15,
                    color: Colors.blueGrey[800],
                  ),
                  //  onTap: ()=>nextSong(true)
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget song(String image, String title, String subtitle) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          image,
          width: 40.0,
          height: 40.0,
        ),
        SizedBox(
          width: 8.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: TextStyle(color: Color(0xFFFE1483))),
            Text(subtitle, style: TextStyle(color: Color(0xFFFE1483)))
          ],
        )
      ],
    ),
  );
}

class MClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: min(size.width, size.height) / 2);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
