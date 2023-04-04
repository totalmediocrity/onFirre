import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  String? id;
  String email, userName, password, image;

  Account(
      {this.id,
      required this.email,
      required this.userName,
      required this.password,
      this.image = 'default.gif'});

  Map<String, dynamic> toJson() => {
        'email': email,
        'userName': userName,
        'password': password,
        'image': image
      };

  static Account fromSnapshot(DocumentSnapshot snapshot) {
    return Account(
      id: snapshot.id,
      email: snapshot['email'],
      userName: snapshot['userName'],
      password: snapshot['password'],
      image: snapshot['image'],
    );
  }
}
