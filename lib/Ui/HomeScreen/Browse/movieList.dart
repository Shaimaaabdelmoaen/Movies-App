import 'package:flutter/material.dart';
import 'package:movies_app/Ui/HomeScreen/Browse/api/ApiManager.dart';
import 'package:movies_app/Ui/HomeScreen/Browse/movieWidget.dart';
import 'api/Genres.dart';

class MovieList extends StatelessWidget {
  static const String routeName = "movies";
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Genres_detail;
    debugPrint(args.name ?? "");
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(args.name ?? "",
                style: const TextStyle(
                    fontSize: 26,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFBAF22),
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.none))),
        body: FutureBuilder(
            future: ApiManager.getMovies(args.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                ));
              }
              if (snapshot.hasError || snapshot.data == null) {
                return Center(
                    child: Text(
                        snapshot.data?.message ?? snapshot.error.toString()));
              }
              var movieList = snapshot.data?.results;
              return Flex(
                direction: Axis.vertical,
                children: [ Expanded(
                  child: ListView.builder(
                      itemBuilder: (context, index) =>
                          MoviesWidget(
                              movie: movieList![index]),
                      itemCount: movieList?.length ?? 0),
                ),],

              );
            }));
  }
}
