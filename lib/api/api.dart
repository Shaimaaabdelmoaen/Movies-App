import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:movies_app/model/constant.dart';
import 'package:movies_app/model/detail/Details.dart';

class Api {
  static const popular =
      "https://api.themoviedb.org/3/movie/popular?api_key=${Constant.apiKey}";
  static const newReleases =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=${Constant.apiKey}";
  static const recomended =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=${Constant.apiKey}";

  // static const likeThis="https://api.themoviedb.org/3/movie/$movieId/similar?api_key=${Constant.apiKey}";



  static Future<List<Details>> getPopularResponse() async {
    var response = await http.get(Uri.parse(popular));
    if (response.statusCode == 200) {
      final decodData = json.decode(response.body)['results'] as List;
      print(decodData);
      return decodData.map((result) => Details.fromJson(result)).toList();
    } else {
      throw Exception("something went wrong");
    }

  }



  static Future<List<Details>> newReleasesResponse() async {
    var response = await http.get(Uri.parse(newReleases));
    if (response.statusCode == 200) {
      final decodData = json.decode(response.body)['results'] as List;
      print(decodData);
      return decodData.map((result) => Details.fromJson(result)).toList();
      // return decodData.map((result) => Rec.fromJson(result)).toList();
    } else {
      throw Exception("something went wrong");
    }
    //var movieResponse = MovieResponse.fromJson(json)
    // return movieResponse;
  }


  static Future<List<Details>> recommendedResponse() async {
    var response = await http.get(Uri.parse(recomended));
    if (response.statusCode == 200) {
      final decodData = json.decode(response.body)['results'] as List;
      print(decodData);
      // return decodData.map((result) => Results.fromJson(result)).toList();
      return decodData.map((result) => Details.fromJson(result)).toList();
    } else {
      throw Exception("something went wrong");
    }
    //var movieResponse = MovieResponse.fromJson(json)
    // return movieResponse;
  }


  static Future<List<Details>> moreLike(String? id) async {

    final likeThis="https://api.themoviedb.org/3/movie/$id/similar?api_key=${Constant.apiKey}";
    var response = await http.get(Uri.parse(likeThis));
    if (response.statusCode == 200) {
      final decodData = json.decode(response.body)['results'] as List;
      print(decodData);
      // return decodData.map((result) => Results.fromJson(result)).toList();
      return decodData.map((result) => Details.fromJson(result)).toList();
    } else {
      throw Exception("something went wrong");
    }
    //var movieResponse = MovieResponse.fromJson(json)
    // return movieResponse;
  }




}
