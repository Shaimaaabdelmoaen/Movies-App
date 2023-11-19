import 'package:flutter/material.dart';
import 'package:movies_app/Ui/HomeScreen/homeScreenWidgets/details/detailss.dart';
import 'package:movies_app/model/constant.dart';
import 'package:movies_app/model/detail/Details.dart';
import 'package:movies_app/network/firestore.dart';


class ReleasrBook extends StatefulWidget {
   ReleasrBook(this.details,{super.key});
  Details details;
  @override
  State<ReleasrBook> createState() => _ReleasrBookState();
}

class _ReleasrBookState extends State<ReleasrBook> {
  String isSave = "assets/images/bookmark.png";
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(MovieDetails.routName,arguments:widget.details );
          },
          child: Image.network(
            "${Constant.imagePathe}${widget.details.posterPath}",
            width: 100,
            height: 140,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
        ),
        Positioned(
          right: 59,
          bottom: 98,
          child: FloatingActionButton(
              backgroundColor: Colors.transparent,
              onPressed: () async {


                // var model = Details(
                //     title: "${widget.details.title}",
                //     releaseDate:
                //     "${widget.details.releaseDate}",
                //     posterPath:
                //     "${widget.details.posterPath}");
               // await FireStoreUtils.addDataToFireStore(model);

                setState(() {
                  isSave = ("assets/images/bookmarkright.png");
                });
              },
              child: Image.asset(
                "${isSave}",
              )),
        )
      ],
    );
  }
}












