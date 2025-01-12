import 'package:flutter/material.dart';

class PlayingpageCasual extends StatelessWidget{
  const PlayingpageCasual({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.amber,
      child: Center(
        child: TextButton(
          onPressed: (){Navigator.pushNamed(context, "/NavBarMenu");},
           style: TextButton.styleFrom(backgroundColor: Colors.red),
           child: Text("Casual Match", style: TextStyle(color: Colors.black, fontSize: 30.0),),
          )
      ),
    );
  } 
}