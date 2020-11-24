import 'package:flutter/material.dart';
import 'package:music_player/model/songs_model.dart';
import 'package:music_player/res/color.dart';

class SongsWidget extends StatelessWidget {
  final List<SongsModel> songList = [
    SongsModel(
        imageUrl: "assets/images/1.jpg",
        title: 'Rather Be',
        singer: 'Clean Bandit',
        duration: '2:58'),
    SongsModel(
        imageUrl:
            'https://zrockr.com/user-files/uploads/2017/09/365603a-emp.jpg',
        title: 'A sound from the heaven',
        singer: 'Orchestry Saga',
        duration: '2:58'),
    SongsModel(
        imageUrl: 'https://usercontent1.hubstatic.com/14007328_f520.jpg',
        title: "Baby, Let's do some shalala",
        singer: 'Keron Jackson',
        duration: '3:38'),
    SongsModel(
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-KZUZ3AeyYS7mXVXOkCGDPsaZQ_c6SFx0-NjOFTJlniv-WFwh',
        title: 'Beat it if you get it',
        singer: 'Hippor Saga',
        duration: '3:23'),
    SongsModel(
        imageUrl:
            'https://media.pitchfork.com/photos/5bfc293d7dac23155a9ebcd0/1:1/w_320/neil%20young_songs%20for%20judy.jpg',
        title: 'Daniol the last over',
        singer: 'Jazzilo Band',
        duration: '2:30'),
    SongsModel(
        imageUrl: 'https://usercontent1.hubstatic.com/14007328_f520.jpg',
        title: "Baby, Let's do some shalala",
        singer: 'Keron Jackson',
        duration: '3:38'),
    SongsModel(
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-KZUZ3AeyYS7mXVXOkCGDPsaZQ_c6SFx0-NjOFTJlniv-WFwh',
        title: 'Beat it if you get it',
        singer: 'Hippor Saga',
        duration: '3:23'),
    SongsModel(
        imageUrl:
            'https://media.pitchfork.com/photos/5bfc293d7dac23155a9ebcd0/1:1/w_320/neil%20young_songs%20for%20judy.jpg',
        title: 'Daniol the last over',
        singer: 'Jazzilo Band',
        duration: '2:30'),
    SongsModel(
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-KZUZ3AeyYS7mXVXOkCGDPsaZQ_c6SFx0-NjOFTJlniv-WFwh',
        title: 'Beat it if you get it',
        singer: 'Hippor Saga',
        duration: '3:23'),
    SongsModel(
        imageUrl:
            'https://media.pitchfork.com/photos/5bfc293d7dac23155a9ebcd0/1:1/w_320/neil%20young_songs%20for%20judy.jpg',
        title: 'Daniol the last over',
        singer: 'Jazzilo Band',
        duration: '2:30'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: songList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(0),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            children: <Widget>[
              Container(
                width: 55,
                height: 55,
                margin: EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    songList[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      songList[index].title,
                      style: TextStyle(
                          color: colorBlack,
                          fontSize: 16,
                          fontFamily: 'Medium'),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      songList[index].singer,
                      style: TextStyle(
                          color: colorGrey, fontSize: 16, fontFamily: 'Medium'),
                    ),
                  ],
                ),
              ),
              Text(
                songList[index].duration,
                style: TextStyle(
                    color: colorGrey, fontSize: 16, fontFamily: 'Medium'),
              ),
            ],
          ),
        );
      },
    );
  }
}
