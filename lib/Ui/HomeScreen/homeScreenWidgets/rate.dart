import 'package:flutter/material.dart';

import 'package:movies_app/model/detail/Details.dart';

class Rate extends StatelessWidget {
  const Rate({super.key, required this.results});

  //Recommend results;

  final Details results;
  // Rec results;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          const Icon(
            Icons.star,
            color: Colors.amber,
            size: 15,
          ),
          //Text("${snapshot.data.voteAverage.toStringAsFixed(1)}/10")
          Text(
            "${results.voteAverage!.toStringAsFixed(1)}/10",
            style: const TextStyle(color: Colors.white, fontSize: 10),
          )
        ],
      ),
      Text(
        "${results.title}",
        style: const TextStyle(
            color: Colors.white, fontSize: 9, fontWeight: FontWeight.w400),
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        "${results.releaseDate}",
        style: const TextStyle(
            color: Colors.white, fontSize: 9, fontWeight: FontWeight.w200),
      )
    ]);
  }
}
