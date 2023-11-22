

import 'package:flutter/material.dart';

import 'package:movies_app/model/detail/Details.dart';



class MovieName extends StatelessWidget {
  const MovieName(
      {super.key,
      // required this.rec,
      required this.results,
      required this.snapshot});

  final AsyncSnapshot snapshot;
  // Results results;
  final Details results;
  //Rec rec;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      //  mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("${results.title}",
            // "  ${rec.title}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            )),
        Text("${results.releaseDate}",
            //Text("${rec.releaseDate}",
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w400,
            )),
      ],
    );
  }
}
