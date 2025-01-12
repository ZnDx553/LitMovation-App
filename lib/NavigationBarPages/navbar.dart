import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:new_tab_bar/NavigationBarPages/PageMatch.dart';
import 'package:new_tab_bar/NavigationBarPages/PageStatistic.dart';
import 'package:new_tab_bar/NavigationBarPages/PageShops.dart';
import 'package:new_tab_bar/NavigationBarPages/PageLogin.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _Home_States();
}

class _Home_States extends State<Home> with SingleTickerProviderStateMixin{
  int Selected_Page = 0;
//Navbar_list
  final List<Widget> _Pages = [
    const PageMatch(),
    const PageStatistic(),
    ShopPage(),
    LoginPage(),
  ];

//Returning a Scafold
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //App Barr
        actions: <Widget>[
          Image.asset("images/blackon_trans_LOGO(nofont).png", height: 80, width: 80,),
        ],
        leading: const Icon(Icons.person, color: Colors.black),
        title: const Text("Haloooo Zaki Gelap", style: TextStyle(color: Colors.black))),



//Navigation Bar
      bottomNavigationBar: GNav(
        selectedIndex: Selected_Page,
        onTabChange: (pageIndex){setState(() {
          Selected_Page = pageIndex;
        });},
      backgroundColor: const Color.fromARGB(255, 197, 197, 197),
      color: Colors.black,
      tabActiveBorder: Border.all(color: Colors.black, width: 1),
      tabShadow: const [
        BoxShadow(color: Colors.red),
      ],
      activeColor: Colors.red,
      tabBackgroundColor: Colors.black,
      iconSize: 24,
      gap: 12,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      tabMargin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      tabs: const [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.query_stats_outlined,
              text: "Stats",
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: "Shop",
            ),
            GButton(
              icon: Icons.login,
              text: "Login page",
            ),
          ],
        ),

      body: _Pages[Selected_Page],
    );
  }
}