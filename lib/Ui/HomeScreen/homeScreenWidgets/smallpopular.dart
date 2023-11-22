import 'package:flutter/material.dart';

import 'package:movies_app/model/constant.dart';
import 'package:movies_app/model/detail/Details.dart';
import 'package:movies_app/network/firestore.dart';


class Small extends StatefulWidget {
  const Small(
      {super.key,
      required this.results,
      //required this.rec,

      required this.snapshot});

  final AsyncSnapshot snapshot;
  // Results results;
  final Details results;

  @override
  State<Small> createState() => _SmallState();
}

class _SmallState extends State<Small> {
  String isSave = "assets/images/bookmark.png";

//Rec rec;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),

            // border: Border.all(color: )
          ),
          margin: const EdgeInsets.all(5),
          width: 140,
          height: 210,
          child: Image.network(
            // "${Constant.imagePathe}${rec.posterPath}",
            "${Constant.imagePathe}${widget.results.posterPath}",

            alignment: Alignment.bottomLeft,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
        ),
        Positioned(
          //top: ,
          right: 104,
          bottom: 170,
          child: FloatingActionButton(
              backgroundColor: Colors.transparent,
              onPressed: () async{
                isSave = ("assets/images/bookmarkright.png");


                  var model = Details(
                      title: "${widget.results.title}", releaseDate: "${widget.results.releaseDate}", posterPath: "${widget.results.posterPath}");
                  await FireStoreUtils.addDataToFireStore(model);

                setState(() {});
              },
              child: Image.asset(
                isSave,
              )),
        )
      ],
    );
  }
}
