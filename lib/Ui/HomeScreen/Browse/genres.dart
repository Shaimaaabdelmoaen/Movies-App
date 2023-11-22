import 'package:flutter/material.dart';
import 'api/Genres.dart';
import 'movieList.dart';

class GenreDetails extends StatelessWidget {
  final Genres_detail genre;
  const GenreDetails(this.genre, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, MovieList.routeName, arguments: genre);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/genresImages/img.png"),
                        fit: BoxFit.cover))),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
              ),
              child: Text(
                genre.name ?? '',
                style: const TextStyle(
                  fontSize: 15,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ));
  }
}
