/// id : 99
/// name : "Documentary"

class Genres {
  Genres({
      this.id, 
      this.name,});

  Genres.fromJson(dynamic json) {
    id = json['id'].toString();
    name = json['name'];
  }
  String? id;
  String? name;
Genres copyWith({  String? id,
  String? name,
}) => Genres(  id: id ?? this.id,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}