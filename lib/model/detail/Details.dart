import 'Genres.dart';
import 'ProductionCountries.dart';

/// adult : false
/// backdrop_path : null
/// belongs_to_collection : null
/// budget : 0
/// genres : [{"id":99,"name":"Documentary"}]
/// homepage : ""
/// id : 532155
/// imdb_id : "tt1528785"
/// original_language : "en"
/// original_title : "Musangwe: Fight Club"
/// overview : "The first rule is that there are no rules. For the bare-knuckle combatants competing in Musangwe fights, anything goes - you can even put a curse on him. The sport, which dates back centuries, has become a South African institution. Any male from the age of nine to ninety can compete. We follow a group of fighters as they slug it out in the ring. Who will be this year's champion?"
/// popularity : 0.84
/// poster_path : "/tZDxttt0LfgAKwvLIWyOO3fr01c.jpg"
/// production_companies : []
/// production_countries : [{"iso_3166_1":"GB","name":"United Kingdom"}]
/// release_date : "2007-10-01"
/// revenue : 0
/// runtime : 62
/// spoken_languages : []
/// status : "Released"
/// tagline : ""
/// title : "Musangwe: Fight Club"
/// video : false
/// vote_average : 8.182
/// vote_count : 11

class Details {
  Details({
      this.adult, 
      this.backdropPath, 
      this.belongsToCollection, 
      this.budget, 
      this.genres, 
      this.homepage, 
      this.id, 
      this.imdbId, 
      this.originalLanguage, 
      this.originalTitle, 
      this.overview, 
      this.popularity, 
      this.posterPath, 
      this.productionCompanies, 
      this.productionCountries, 
      this.releaseDate, 
      this.revenue, 
      this.runtime, 
      this.spokenLanguages, 
      this.status, 
      this.tagline, 
      this.title, 
      this.video, 
      this.voteAverage, 
      this.voteCount,
      this.isFavorite = false,
  });

  Details.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'];
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'].toString();
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    // if (json['production_companies'] != null) {
    //   productionCompanies = [];
    //   json['production_companies'].forEach((v) {
    //     productionCompanies?.add(productionCompanies.fromJson(v));
    //   });
    // }
    if (json['production_companies'] != null) {
      productionCompanies = [];
      json['production_companies'].forEach((v) {
        productionCompanies?.add(v); // Use 'v' directly since it's of type dynamic
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = [];
      json['production_countries'].forEach((v) {
        productionCountries?.add(ProductionCountries.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    // if (json['spoken_languages'] != null) {
    //   spokenLanguages = [];
    //   json['spoken_languages'].forEach((v) {
    //     spokenLanguages?.add(Dynamic.fromJson(v));
    //   });
    // }


    if (json['spoken_languages'] != null) {
      spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        spokenLanguages?.add(v); // Use 'v' directly since it's of type dynamic
      });
    }


    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
  bool? adult;
  dynamic backdropPath;
  dynamic belongsToCollection;
  int? budget;
  List<Genres>? genres;
  String? homepage;
  String? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<dynamic>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<dynamic>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  bool? isFavorite  = false;
Details copyWith({  bool? adult,
  dynamic backdropPath,
  dynamic belongsToCollection,
  int? budget,
  List<Genres>? genres,
  String? homepage,
  String? id,
  String? imdbId,
  String? originalLanguage,
  String? originalTitle,
  String? overview,
  double? popularity,
  String? posterPath,
  List<dynamic>? productionCompanies,
  List<ProductionCountries>? productionCountries,
  String? releaseDate,
  int? revenue,
  int? runtime,
  List<dynamic>? spokenLanguages,
  String? status,
  String? tagline,
  String? title,
  bool? video,
  double? voteAverage,
  int? voteCount,
  bool? isFavourite = false
}) => Details(  adult: adult ?? this.adult,
  backdropPath: backdropPath ?? this.backdropPath,
  belongsToCollection: belongsToCollection ?? this.belongsToCollection,
  budget: budget ?? this.budget,
  genres: genres ?? this.genres,
  homepage: homepage ?? this.homepage,
  id: id ?? this.id,
  imdbId: imdbId ?? this.imdbId,
  originalLanguage: originalLanguage ?? this.originalLanguage,
  originalTitle: originalTitle ?? this.originalTitle,
  overview: overview ?? this.overview,
  popularity: popularity ?? this.popularity,
  posterPath: posterPath ?? this.posterPath,
  productionCompanies: productionCompanies ?? this.productionCompanies,
  productionCountries: productionCountries ?? this.productionCountries,
  releaseDate: releaseDate ?? this.releaseDate,
  revenue: revenue ?? this.revenue,
  runtime: runtime ?? this.runtime,
  spokenLanguages: spokenLanguages ?? this.spokenLanguages,
  status: status ?? this.status,
  tagline: tagline ?? this.tagline,
  title: title ?? this.title,
  video: video ?? this.video,
  voteAverage: voteAverage ?? this.voteAverage,
  voteCount: voteCount ?? this.voteCount,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['belongs_to_collection'] = belongsToCollection;
    map['budget'] = budget;
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    map['homepage'] = homepage;
    map['id'] = id;
    map['imdb_id'] = imdbId;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    if (productionCompanies != null) {
      map['production_companies'] = productionCompanies?.map((v) => v.toJson()).toList();
    }
    if (productionCountries != null) {
      map['production_countries'] = productionCountries?.map((v) => v.toJson()).toList();
    }
    map['release_date'] = releaseDate;
    map['revenue'] = revenue;
    map['runtime'] = runtime;
    if (spokenLanguages != null) {
      map['spoken_languages'] = spokenLanguages?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['tagline'] = tagline;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

  factory Details.fromFireStore(Map<String, dynamic> json){
    return Details(
        id: json["id"],
        title: json["title"],
       releaseDate : json["releaseDate"],
        posterPath: json["posterPath"],
      isFavorite: json['isFavorite'],
    );
  }

  Map<String, dynamic> toFireStore(){
    return {
      "id" : id,
      "title" : title,
      "posterPath" : posterPath,
      "releaseDate" : releaseDate,
      'isFavorite': true,
    };
  }
}