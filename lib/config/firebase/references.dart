import 'package:cloud_firestore/cloud_firestore.dart';

class References {
  static final constants =
      Firestore.instance.document("constants/JYZXYmXz5A2k2aTFatix");

  static final users = Firestore.instance.collection("users");
  static final restaurants = Firestore.instance.collection("restaurants");

}
