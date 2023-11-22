import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/model/detail/Details.dart';
import '../../../network/firestore.dart';

class SavedMoviesWidget extends StatelessWidget {
  final Details model;
   SavedMoviesWidget({super.key, required this.model});
  String isSave = "assets/images/bookmark.png";
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children:[CachedNetworkImage(
      height: 150,
        width: 120,
        imageUrl: "https://image.tmdb.org/t/p/w500${model.posterPath}",
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
              Positioned(
                // left:1,
                //top: ,
                right: 75,
                bottom: 100,
                child: FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    onPressed: () async {
                      await FireStoreUtils.deleteDataFromFireStore(model);
                    },
                    child: Image.asset('assets/images/bookmarkright.png'
                    )),
              )
            ]
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
               " ${model.title},",
                style: const TextStyle(color: Colors.white, fontSize: 17),
              ),
              Text(
                "${model.releaseDate}",
                style: const TextStyle(color: Color(0xFFFBAF22), fontSize: 15),
              ),
            ],
          )
        ],
      ),
    ]);
  }
}