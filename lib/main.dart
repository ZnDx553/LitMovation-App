import 'package:flutter/material.dart';
import 'package:new_tab_bar/InsidePages/PlayingPage/PlayingPage(offline).dart';
import 'package:new_tab_bar/InsidePages/PlayingPage/PlayingPage(offline_multiplayer).dart';
import 'package:new_tab_bar/InsidePages/PlayingPage/PlayingPage(ranked).dart';
import 'package:new_tab_bar/NavigationBarPages/navbar.dart';
import 'InsidePages/PlayingPage/PlayingPage(casual).dart';

void main() {
  runApp(MaterialApp(
    home: const Home(),
    debugShowCheckedModeBanner: false,
    title: "Aplikasi tab bar Zaki gelap",
    routes: {
      "/OfflineMode_MatchPage" :(context) => const PlayingpageOfflineMode(),
      "/OfflineMultiplayer_MatchPage" :(context) => PlayingpageOfflineMultiplayer(),
      "/Casual_MatchPage" :(context) => PlayingpageCasual(),
      "/Ranked_MatchPage" :(context) => PlayingpageRanked(),
      "/NavBarMenu" :(context) => const Home(),

    },
  ));
}
