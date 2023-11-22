import 'package:flutter/material.dart';

import 'package:movies_app/Ui/HomeScreen/homeScreenWidgets/newReleases.dart';
import 'package:movies_app/Ui/HomeScreen/homeScreenWidgets/popularScreeen.dart';
import 'package:movies_app/Ui/HomeScreen/homeScreenWidgets/recomendScreen.dart';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/model/detail/Details.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late Future<List<Results>> popularScreen  ;
  late Future<List<Details>> releasesScreen;
  // late Future<List<Recomend>> recomendedScreen;
  late Future<List<Details>> recomendedScreen;
  // late Future<List<Results>> popularScreen;
  late Future<List<Details>> popularScreen;
  //late Future<List<Rec>> releasesScreen;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    popularScreen = Api.getPopularResponse();
    releasesScreen = Api.newReleasesResponse();
    recomendedScreen = Api.recommendedResponse();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        //  backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  //   height: ,
                  child: FutureBuilder(
                    future: popularScreen,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Column(
                            children: [
                              Text(snapshot.error.toString()),
                              ElevatedButton(
                                  onPressed: () {}, child: const Text("try again"))
                            ],
                          ),
                        );
                      }
                      //  var  sourcesList = snapshot.data?. ??[];
                      return PopularScreen(
                        snapshot: snapshot,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  color: const Color(0xEF282A28),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "New Releases ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FutureBuilder(
                          future: releasesScreen,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Column(
                                  children: [
                                    Text(snapshot.error.toString()),
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: const Text("try again"))
                                  ],
                                ),
                              );
                            }
                            return ReleasesScreen(snapshot);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  color: const Color(0xEF282A28),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Recommended ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        FutureBuilder(
                          future: recomendedScreen,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              // print(snapshot.error.toString());
                              return Center(
                                child: Column(
                                  children: [
                                    Text(snapshot.error.toString()),
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: const Text("try again"))
                                  ],
                                ),
                              );
                            }
                            //  int index = 0;
                            return RecomendScreen(
                              snapshot: snapshot,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
