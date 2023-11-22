// import 'package:flutter/cupertino.dart';
// import 'package:movieapp/model/recomend.dart';
//
// import '../model/constant.dart';
//
// class response extends StatelessWidget {
//   response(this.results, {super.key});
//
//   Results results;
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(itemBuilder: (context, index) {
//
//
//        {
//         return Padding(
//           padding: const EdgeInsets.all(8),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: SizedBox(
//               height: 300,
//               //  width: double.infinity,
//               width: 500,
//               child: Image.network(
//                 //"${results.posterPath}",
//                  " ${Constant.imagePathe[index]}${results.posterPath}",
//                 fit: BoxFit.fill,
//                 filterQuality: FilterQuality.high,
//               ),
//             ),
//           ),
//         );
//       }}
//     );
//   }
// }
