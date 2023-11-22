import 'package:flutter/material.dart';
import 'package:movies_app/Ui/HomeScreen/homeScreenWidgets/details/releasebook.dart';

class ReleasesScreen extends StatefulWidget {
  final AsyncSnapshot snapshot;

  const ReleasesScreen(this.snapshot, {super.key});

  @override
  State<ReleasesScreen> createState() => _ReleasesScreenState();
}

class _ReleasesScreenState extends State<ReleasesScreen> {
  String isSave = "assets/images/bookmark.png";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xEF282A28),
      child: SizedBox(
        width: double.infinity,
        // width: double.infinity,
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  height: 130,
                  width: 100,
                   child:ReleaseBook(widget.snapshot.data![index]),
            //Stack(
                  //   children: [
                  //     GestureDetector(
                  //       onTap: (){
                  //         Navigator.of(context).pushNamed(MovieDetails.routName,arguments:widget.snapshot.data[index] );
                  //       },
                  //       child: Image.network(
                  //         "${Constant.imagePathe}${widget.snapshot.data![index].posterPath}",
                  //         width: 100,
                  //         height: 140,
                  //         fit: BoxFit.fill,
                  //         filterQuality: FilterQuality.high,
                  //       ),
                  //     ),
                  //     Positioned(
                  //       right: 59,
                  //       bottom: 98,
                  //       child: FloatingActionButton(
                  //           backgroundColor: Colors.transparent,
                  //           onPressed: () async {
                  //
                  //
                  //             var model = Details(
                  //                 title: "${widget.snapshot.data.title}",
                  //                 releaseDate:
                  //                 "${widget.snapshot.data!.releaseDate}",
                  //                 posterPath:
                  //                 "${widget.snapshot.data!.posterPath}");
                  //             await FireStoreUtils.addDataToFireStore(model);
                  //
                  //             setState(() {
                  //               isSave = ("assets/images/bookmarkright.png");
                  //             });
                  //           },
                  //           child: Image.asset(
                  //             "${isSave}",
                  //           )),
                  //     )
                  //   ],
                  // ),

                ),
              ),
            );
          },
          itemCount: widget.snapshot.data.length,
        ),
      ),
    );
  }
}
