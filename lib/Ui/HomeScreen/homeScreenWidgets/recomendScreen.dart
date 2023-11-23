import 'package:flutter/material.dart';
import 'package:movies_app/Ui/HomeScreen/homeScreenWidgets/details/stackBook.dart';
import 'package:movies_app/Ui/HomeScreen/homeScreenWidgets/rate.dart';

class RecommendScreen extends StatefulWidget {
  const RecommendScreen({
    super.key,
    required this.snapshot,
  });
  final AsyncSnapshot snapshot;

  @override
  State<RecommendScreen> createState() => _RecommendScreenState();
}

class _RecommendScreenState extends State<RecommendScreen> {
//Results results;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.snapshot.data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 190,
                width: 105,
                child: Column(
                  children: [
                    StackBook(widget.snapshot.data[index]),
                    Expanded(
                        child: Rate(results: widget.snapshot.data![index])),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
// Stack(
//   children: [
//     GestureDetector(
//       onTap: () {
//         Navigator.of(context).pushNamed(
//             MovieDetails.routName,
//             arguments: widget.snapshot.data[index]);
//       },
//       child: Image.network(
//         "${Constant.imagePathe}${widget.snapshot.data[index]!.posterPath}",
//         width: 105,
//         height: 130,
//         fit: BoxFit.fill,
//         filterQuality: FilterQuality.high,
//       ),
//     ),
//     Positioned(
//       // left:1,
//       //top: ,
//       right: 62,
//       bottom: 83,
//       child: FloatingActionButton(
//           backgroundColor: Colors.transparent,
//           onPressed: () async {
//
//
//             isSave = ("assets/images/bookmarkright.png");
//             var model = Details(
//                 title: "${widget.snapshot.data.title}",
//                 releaseDate:
//                     "${widget.snapshot.data!.releaseDate}",
//                 posterPath:
//                     "${widget.snapshot.data!.posterPath}");
//             await FireStoreUtils.addDataToFireStore(model);
//
//             setState(() {
//
//             });
//           },
//           child: Image.asset(
//             "${isSave}",
//           )),
//     )
//   ],
// ),
