import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/Ui/HomeScreen/Browse/api/MovieResponse/MovieResponse.dart';
import 'package:movies_app/Ui/HomeScreen/Browse/api/sourcesResponse.dart';

class ApiManager{
  static Future<SourcesResponse> getSources()async{
    var response = await http.get(Uri.parse("https://api.themoviedb.org/3/genre/movie/list?language=en"),
        headers: { HttpHeaders.authorizationHeader :
        "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ODlkZDNhZmIzNTFhZTMwNWU5MzE4ODI3Mzc3NTRhYiIsInN1YiI6IjY1NDQxMmViNDFhNTYxMzM2OTM5MjkxNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8csGfzFJr0QwJixs2Ybgais5nTWwL-DofCNG9CA9CfA"
    });
      final result = jsonDecode(response.body);
      debugPrint(response.body);
      var sourcesResponse = SourcesResponse.fromJson(result);
      return sourcesResponse;
    }

    static Future<MovieResponse> getMovies(int? genreId)async{
      var uri = Uri.https("api.themoviedb.org","3/discover/movie",{
        "language=" : "en",
        "with_genres" : genreId.toString()
        });
    var response = await http.get(uri ,
    headers:{ HttpHeaders.authorizationHeader:
        "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ODlkZDNhZmIzNTFhZTMwNWU5MzE4ODI3Mzc3NTRhYiIsInN1YiI6IjY1NDQxMmViNDFhNTYxMzM2OTM5MjkxNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8csGfzFJr0QwJixs2Ybgais5nTWwL-DofCNG9CA9CfA"
    });
    var json = jsonDecode(response.body);
    debugPrint(response.body);
    var movieResponse = MovieResponse.fromJson(json);
    return movieResponse;
    }
}