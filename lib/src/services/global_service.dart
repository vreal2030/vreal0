// import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vreal_0/src/models/supplement_category_model.dart';

class GlobalService {}

class SupplementCategoryService extends GlobalService {
  final supplementCategoryCollection =
      FirebaseFirestore.instance.collection('supplementCategory');

  Future<QuerySnapshot> read() async {
    return supplementCategoryCollection.get();
  }

  void create(SupplementCategory newCategory) async {
    await supplementCategoryCollection.add(newCategory.toJson());
  }

  // void saveSupplementCategoryList(List<SupplementCategory> saveList) {
  //   List<String> stringCategoryList = [];
  //   for (SupplementCategory supplementCategory in saveList) {
  //     // model -> Map
  //     Map<String, dynamic> jsonMap = supplementCategory.toJson();
  //     // Map -> String
  //     String stringSupplementCategory = jsonEncode(jsonMap);
  //     stringCategoryList.add(stringSupplementCategory);
  //   }
  //   //최종 저장
  //   supplementCategoryCollection
  //       .doc('supplementCategoryList')
  //       .set({'supplementCategoryList': stringCategoryList});
  // }
}
