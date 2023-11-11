import 'package:flutter/material.dart';
import 'package:movies_app/Ui/HomeScreen/Browse/movieList.dart';
import 'package:movies_app/Ui/HomeScreen/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        homeScreen.routename : (_) =>homeScreen(),
        MovieList.routeName : (_) => const MovieList()
      },
      initialRoute: homeScreen.routename,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF1A1A1A),
          primary: Color(0xFF1A1A1A),
          secondary: Color(0xFF1A1A1A),
          onPrimary: Colors.white,
          onSecondary: Colors.black
        ),
        primaryColor: Color(0xFF1A1A1A),
          secondaryHeaderColor: Colors.black,
          scaffoldBackgroundColor:Colors.transparent ,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Color(0xFFFBAF22),
          unselectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(
              size: 32
          ),
        ),
          useMaterial3: true
      ),
    );
  }
}