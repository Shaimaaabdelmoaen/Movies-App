/// id : 28
/// name : "Action"

class Genres_detail {
  Genres_detail({
      this.id, 
      this.name,});

  Genres_detail.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;
Genres_detail copyWith({  int? id,
  String? name,
}) => Genres_detail(  id: id ?? this.id,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}