import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String uid;
  String namalengkap;
  String username;
  String nohp;
  String email;
  DateTime timestamp;

  UserModel({this.uid, this.namalengkap, this.username, this.nohp, this.email, this.timestamp});

  Map toMap(UserModel user) {
    var data = Map<String, dynamic>();

    data["uid"] = user.uid;
    data["namalengkap"] = user.namalengkap;
    data["username"] = user.username;
    data["nohp"] = user.nohp;
    data["email"] = user.email;
    data["timestamp"] = user.timestamp;

    return data;
  }

  UserModel.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData["uid"];
    this.namalengkap = mapData["namalengkap"];
    this.username = mapData["username"];
    this.nohp = mapData["nohp"];
    this.email = mapData["email"];
  }
}
