import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'settings_page.dart';
import 'main_page.dart';
import 'timeline_page.dart';
import 'breathe_page.dart';
import 'entry_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user=FirebaseAuth.instance.currentUser!;
  int selectedIndex=0; 
  void signUserOut(){
     FirebaseAuth.instance.signOut();
  }
  void _navigationBottomBar(int index){
    setState((){
      selectedIndex=index;
    });
    print(selectedIndex);
  }
  
  final List<Widget> pages= [ 
      MainPage(),
      TimelinePage(),
      EntryPage(),
      BreathePage(),
      Settings()
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
      Container(
        color:Colors.purple,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: GNav(
              onTabChange: (index){
                 _navigationBottomBar(index);
              },
              backgroundColor: Colors.purple,
              color:Colors.black,
              activeColor:Colors.black,
              tabBackgroundColor: Colors.white,
              padding:EdgeInsets.all(16),
              gap:10,
              tabs: const [ 
                GButton(icon:Icons.home, text:"Home"),
                GButton(icon:Icons.calendar_month, text:"Timeline"),
                GButton(icon:Icons.add_circle, text:"Add Entry"),
                GButton(icon:Icons.self_improvement, text:"Search"),
                GButton(icon:Icons.settings, text:"Settings")
              ],
            ),
        ),
      ),
       body:pages[selectedIndex]
    );
  }
}


