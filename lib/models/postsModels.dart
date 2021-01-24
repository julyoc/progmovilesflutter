import './usersModels.dart';

class PostModel {
  String title;
  String description;
  UserModel user;

  PostModel({this.title, this.description, this.user});

  PostModel.fromJson (dynamic json) {
    if (json != null) {
      title = json['title'];
      description = json['description'];
      user = UserModel.fromJson(json['userId']);
    }
  }

    static List<PostModel> fromArray(List<dynamic> lista) {
      return lista.map((e) => PostModel.fromJson(e)).toList();
    }

}