import 'package:cloud_firestore/cloud_firestore.dart';

class DocWithIndex {
  final QueryDocumentSnapshot document;
  final int index;

  DocWithIndex({
    required this.document,
    required this.index,
  });
}
