import 'package:flutter/material.dart';

class PageMatch extends StatelessWidget{
  const PageMatch({super.key});

  @override
  Widget build(BuildContext context){
    return Container(


      color: const Color.fromARGB(0, 0, 0, 0),
      child: Center(
        child : ListView(
          children: [
            Column(
              children: [
                const Padding(padding: EdgeInsets.all(20.0),),
                SizedBox(
                  width: 550,
                  child : TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, "/Casual_MatchPage");
                    }, 
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(225, 199, 41, 41),
                      padding: const EdgeInsets.all(10)
                    ),
                    child:const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Casual Match", style: TextStyle(color: Colors.black, fontSize: 30.0),),
                        Icon(Icons.smartphone, size: 90.0, color: Colors.red,),
                      ]
                    ),
                  ),
                ),

                const Padding(padding: EdgeInsets.all(5.0),),
                SizedBox(
                  width: 550,
                  child : TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, "/Ranked_MatchPage");
                    }, 
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(225, 199, 41, 41),
                      padding: const EdgeInsets.all(10)
                    ),
                    child:const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Ranked competition", style: TextStyle(color: Colors.black, fontSize: 30.0),),
                        Icon(Icons.smartphone, size: 90.0, color: Colors.red,),
                      ]
                    ),
                  ),
                ),

                const Padding(padding: EdgeInsets.all(5.0),),
                SizedBox(
                  width: 550,
                  child : TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, "/OfflineMultiplayer_MatchPage");
                    }, 
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(225, 199, 41, 41),
                      padding: const EdgeInsets.all(10)
                    ),
                    child:const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Offline Multiplayer", style: TextStyle(color: Colors.black, fontSize: 30.0),),
                        Icon(Icons.smartphone, size: 90.0, color: Colors.red,),
                      ]
                    ),
                  ),
                ),

                const Padding(padding: EdgeInsets.all(5.0),),
                SizedBox(
                  width: 550,
                  child : TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, "/OfflineMode_MatchPage");
                    }, 
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(225, 199, 41, 41),
                      padding: const EdgeInsets.all(10)
                    ),
                    child:const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Offline Mode", style: TextStyle(color: Colors.black, fontSize: 30.0),),
                        Icon(Icons.smartphone, size: 90.0, color: Colors.red,),
                      ]
                    ),
                  ),
                ),
              ],
            )
          ]
        ),
      )
    );
  } 
}


//                Text("Casual Match", style: TextStyle(color: Colors.black, fontSize: 30.0),),
//                Icon(Icons.smartphone, size: 90.0, color: Colors.red,),