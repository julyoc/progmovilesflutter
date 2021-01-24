class UserModel {
  List<String> name;
  String id;
  UserModel({this.id, this.name});
  UserModel.fromJson(dynamic json) {
    if (json != null) {
      name = json["name"];
      id = json["_id"];
    }
  }
  static List<UserModel> fromArray(List<dynamic> lista) {
    return lista.map((e) => UserModel.fromJson(e)).toList();
  }
}