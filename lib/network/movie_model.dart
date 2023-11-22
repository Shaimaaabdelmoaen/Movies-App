// import 'package:movies_app/model/detail/Details.dart';
// import 'package:movies_app/network/firestore.dart';
//
// class MovieModel{
//   String? id;
//   String title;
//   String photo;
//   String date;
//   MovieModel({this.id,
//     required this.title,
//     required this.date,
//     required this.photo});
//
//   factory MovieModel.fromFireStore(Map<String, dynamic> json){
//     return MovieModel(
//         id: json["id"],
//         title: json["title"],
//         date: json["date"],
//         photo: json["photo"]
//     );
//   }
//
//    Map<String, dynamic> toFireStore(){
//      return {
//        "id" : id,
//        "title" : title,
//        "photo" : photo,
//        "date" : date,
//      };
// }
//
// }
