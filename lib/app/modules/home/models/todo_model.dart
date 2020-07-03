import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String title;
  bool check;
  final DocumentReference reference;

  TodoModel({this.reference, this.title, this.check});

  factory TodoModel.fromDocument(DocumentSnapshot doc) {
    return TodoModel(
        title: doc['title'], check: doc['check'], reference: doc.reference);
  }
}
