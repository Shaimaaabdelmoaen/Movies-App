import 'package:flutter/material.dart';
import 'package:movies_app/Ui/HomeScreen/Browse/Browse.dart';
import 'package:movies_app/Ui/HomeScreen/Search/Search.dart';
import 'package:movies_app/Ui/HomeScreen/homeScreenWidgets/homeScreen.dart';

import 'WatchList/WatchList.dart';

class Home extends StatefulWidget{
  static const String routeName='home';

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectTapIndex=0;
  List<Widget>taps=[
    const HomeScreen(),
    const Search(),
    const Browse(),
    const WatchList()
  ];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Theme.of(context).primaryColor,
     bottomNavigationBar: BottomNavigationBar(
       onTap: (index){
         setState(() {
           selectTapIndex=index;
         });
       },
       currentIndex: selectTapIndex,
       items: [
         const BottomNavigationBarItem(
           backgroundColor: Colors.black,
             icon: ImageIcon(AssetImage('assets/images/Home_icon.png'),
               size: 35,
             ),
           label: ''
         ),
         BottomNavigationBarItem(
             backgroundColor: Theme.of(context).primaryColor,
             icon:const ImageIcon(AssetImage('assets/images/Search_icon.png'),
               size: 35,
             ),
           label: ''
         ),
         BottomNavigationBarItem(
             backgroundColor: Theme.of(context).primaryColor,
             icon:const ImageIcon(AssetImage('assets/images/Downloads_icon.png'),
               size: 35,
             ),
           label: ''
         ),
         BottomNavigationBarItem(
             backgroundColor: Theme.of(context).primaryColor,
             icon:const ImageIcon(AssetImage('assets/images/watchList_icon.png'),
               size: 35,
             ),
           label: ''
         )

       ],
     ),
     body:taps[selectTapIndex] ,


   );
  }
}