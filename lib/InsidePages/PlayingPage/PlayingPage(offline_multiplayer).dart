import 'package:flutter/material.dart';

class PlayingpageOfflineMultiplayer extends StatelessWidget{
  const PlayingpageOfflineMultiplayer({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.amber,
      child: Center(
        child: TextButton(
          onPressed: (){Navigator.pushNamed(context, "/NavBarMenu");},
           style: TextButton.styleFrom(backgroundColor: Colors.red),
           child: Text("Oflline Multiplayer", style: TextStyle(color: Colors.black, fontSize: 30.0),),
          )
      ),
    );
  } 
}