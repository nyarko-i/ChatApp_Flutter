import 'dart:convert';

class UserModel {
  final String? uid;
  final String? name;
  final String? email;
  final String? imageUrl;

  UserModel({this.uid, this.name, this.email, this.imageUrl});

  // Convert UserModel to a map for Firestore
  Map<String, dynamic> toMap() {
    return {'uid': uid, 'name': name, 'email': email, 'imageUrl': imageUrl};
  }

  // Create a UserModel from Firestore document
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] != null ? map["uid"] as String : null,
      name: map['name'] != null ? map["name"] as String : null,
      email: map['email'] != null ? map["email"] as String : null,
      imageUrl: map['imageUrl'] != null ? map["imageUrl"] as String : null,
    );
  }

  String toJson() => jsonEncode(toMap());

  // Create a UserModel
  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source));
}
