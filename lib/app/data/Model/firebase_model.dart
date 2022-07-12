import 'package:firebase_storage/firebase_storage.dart';

class FirebaseModel{
Reference? ref;
  String? url;
  String? name;

  FirebaseModel({required this.ref, required this.name, required this.url});
  
}