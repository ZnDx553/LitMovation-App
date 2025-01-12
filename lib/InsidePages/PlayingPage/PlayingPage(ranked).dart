import 'package:flutter/material.dart';

class PlayingpageRanked extends StatelessWidget{
  const PlayingpageRanked({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.amber,
      child: Center(
        child: TextButton(
          onPressed: (){Navigator.pushNamed(context, "/NavBarMenu");},
           style: TextButton.styleFrom(backgroundColor: Colors.red),
           child: Text("Ranked Match", style: TextStyle(color: Colors.black, fontSize: 30.0),),
          )
      ),
    );
  } 
}