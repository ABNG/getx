import 'package:quiver_hashcode/hashcode.dart';

class PostModel {
  int postId;
  int id;
  String name;
  String email;
  String body;

  PostModel({this.postId, this.id, this.name, this.email, this.body});
  bool operator ==(o) => o is PostModel && name == o.name;
  int get hashCode => hash2(name.hashCode, name.hashCode);

  PostModel.fromJson(dynamic json) {
    postId = json["postId"];
    id = json["id"];
    name = json["name"];
    email = json["email"];
    body = json["body"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["postId"] = postId;
    map["id"] = id;
    map["name"] = name;
    map["email"] = email;
    map["body"] = body;
    return map;
  }
}
