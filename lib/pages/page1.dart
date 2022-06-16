import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musique/pages/music_list.dart';
import 'page2.dart';
import 'player_page.dart';



class Page1 extends StatelessWidget {
  const Page1({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
        leading: IconButton(onPressed: null, icon:Icon(Icons.menu,
         color: Colors.white,),
       ),
       actions: [
         IconButton(onPressed: null, 
         icon:Icon(Icons.more_vert,
         color: Colors.white,
         ),
       ),

       ],
        
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
           HeaderSection(),
            PlayListSection(),
            

        ]),
        
      ),
      bottomNavigationBar: BottomSection(),
    );
  }
}

class BottomSection extends StatelessWidget {
  @override 
  Widget build (BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blue,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items:[BottomNavigationBarItem(
        icon: Icon(Icons.pause, color: Colors.white,),
    label: '',
    ),
    BottomNavigationBarItem(
        icon:Text('Imagine . Ariane Grande'),
    label: '',
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.arrow_circle_up, color: Colors.white,),
    label: '',
    ),

    ]
    );
   }
 }

class MyAppBar extends StatelessWidget implements PreferredSizeWidget { 
  Size get preferredSize => new Size.fromHeight(60);
  @override 
  Widget build(BuildContext context) { 
    return AppBar(
      elevation: 0,
      leading: IconButton(
        onPressed: null,
       icon: Icon(Icons.menu, 
       color: Colors.white,
       size: 25)
       ),
    ); 
  }
}

class HeaderSection extends StatelessWidget {
  @override 
  Widget build (BuildContext context) { 
    return Container(
      height: 500,
      decoration: BoxDecoration(
        color: Colors.red,
        image: DecorationImage(image: AssetImage('images/gims.jpeg'),
        fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
        )
        
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            bottom: 30,
            child: Text('Maitre Gims', style: GoogleFonts.arizonia(
              color: Colors.white,
              fontSize: 43,
              fontWeight: FontWeight.w800
            ),)
            ),
            Positioned(
              right: 0,
              bottom: 20,

              child: MaterialButton(onPressed: (() {
                Navigator.push(context, 
                MaterialPageRoute(builder: ((context) => PlayerPage()
                )
                ),
                );
                
                
              }),
              color: Colors.blue, 
              shape: CircleBorder(),
              child:  Padding(
                padding: EdgeInsets.all(17),
                child: Icon(Icons.play_arrow_rounded,
                color: Colors.white,
                size: 30,
                ),
                ),
                ),
                ),

      ]),
      
    );
   }
 }

 class PlayListSection extends StatelessWidget {
  final List playList = [
    { 
      'title':'Sapé comme jamais',
      'duration': '3,16',
      'played': false,
     },
     { 
      'title':'Tout donné',
      'duration': '3,26',
      'played': true,
     },
     { 
      'title':'Corassol',
      'duration': '3,56',
      'played': false,
     },
     { 
      'title':'Gims ft Niska',
      'duration': '4,16',
      'played': false,
     },
     { 
      'title':'Gims ft Dadju',
      'duration': '3,36',
      'played': false,
     },

  ];
  @override 
  Widget build (BuildContext context) { 
    return Container(
      padding: EdgeInsets.fromLTRB(30, 40, 20, 20),
     
      child: Column(
        children: [
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Popular', 
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: Text('Show all',
              style: TextStyle(fontSize: 13,
              color: Colors.blue),
              ),
            )
          ],
         ),
         SizedBox(height: 20,),
         Column(
          children: playList.map((song) {
            return musiclist(song); 
            /*Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(song['title'], style: TextStyle(color:song['played'] ? Colors.blue : Colors.black
                  ),
                  ),
                  Row(
                    children: [
                       Text(song['duration']
                       ),
                       SizedBox(width: 10,),
                       Icon(Icons.more_vert,
                       color: Colors.grey,
                       ),
                       
                    ],
                  )
                  
                ],
              )
            );*/
           }).toList()
         ),
         

         
        ],
      ),
    );
   }
   }