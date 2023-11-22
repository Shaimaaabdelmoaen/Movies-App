import 'package:flutter/material.dart';
import 'package:movies_app/Ui/HomeScreen/homeScreenWidgets/details/detailss.dart';
import 'package:movies_app/model/constant.dart';
import 'package:movies_app/model/detail/Details.dart';
import 'package:movies_app/network/firestore.dart';

class StackBook extends StatefulWidget {
   const StackBook(this.details,{super.key});
final Details details;

  @override
  State<StackBook> createState() => _StackBookState();
}

class _StackBookState extends State<StackBook> {
   String isSave = ("assets/images/bookmark.png");
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
                MovieDetails.routName,
                arguments: widget.details);
          },
          child: Image.network(
            "${Constant.imagePathe}${widget.details.posterPath}",
            width: 105,
            height: 130,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
        ),
        Positioned(
          // left:1,
          //top: ,
          right: 62,
          bottom: 83,
          child: FloatingActionButton(
              backgroundColor: Colors.transparent,
              onPressed: () async {

                if(isSave == ("assets/images/bookmarkright.png")){
                  return;
                }
                else
                  {
                    isSave = ("assets/images/bookmarkright.png");
                    var model = Details(
                        title: "${widget.details.title}",
                        releaseDate:
                        "${widget.details.releaseDate}",
                        posterPath:
                        "${widget.details.posterPath}");
                    await FireStoreUtils.addDataToFireStore(model);
                  }
                setState(() {

                });

              },
              child: Image.asset(
                isSave,
              )),
        )
      ],
    );
  }
}
