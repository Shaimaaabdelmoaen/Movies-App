import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'api/MovieResponse/Results.dart';

class MoviesWidget extends StatelessWidget {
  final Result movie;
  const MoviesWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CachedNetworkImage(
        height: 300,
        width: 240,
        imageUrl: "https://image.tmdb.org/t/p/w500${movie.posterPath}",
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
      const SizedBox(
        height: 20,
      ),
      Text(
        movie.title ?? "",
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 20,
      ),
      SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(
            movie.overview ?? "",
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 13),
          )),
      const SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            const Icon(
              Icons.star,
              color: Color(0xFFFBAF22),
            ),
            Text(
              "${movie.voteAverage ?? ''} / 10 ",
              style: const TextStyle(color: Colors.white, fontSize: 17),
            ),
          ]),
          Text(
            "Votes: ${movie.voteCount ?? ''} / ${movie.originalLanguage ?? ''}  ",
            style: const TextStyle(color: Color(0xFFFBAF22), fontSize: 15),
          ),
          //

          Text(
            movie.releaseDate ?? '',
            style: const TextStyle(color: Color(0xFFFBAF22), fontSize: 15),
            textAlign: TextAlign.end,
          ),
        ],
      ),
      const SizedBox(
        height: 60,
      )
    ]);
  }
}
