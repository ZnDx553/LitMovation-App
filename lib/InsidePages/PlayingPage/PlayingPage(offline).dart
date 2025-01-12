import 'package:flutter/material.dart';

class PlayingpageOfflineMode extends StatelessWidget{
  const PlayingpageOfflineMode({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.amber,
      child: Center(
        child: TextButton(
          onPressed: (){Navigator.pushNamed(context, "/NavBarMenu");},
           style: TextButton.styleFrom(backgroundColor: Colors.red),
           child: const Text("Offline Mode", style: TextStyle(color: Colors.black, fontSize: 30.0),),
          )
      ),
    );
  } 
}