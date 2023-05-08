// import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vreal_0/src/models/supplement_category_model.dart';

class GlobalService {
  // Supplemnt Category Collection
  final supplementCategoryCollection =
      FirebaseFirestore.instance.collection('supplementCategory');

  Future<QuerySnapshot> readSupplementCategory() async {
    debugPrint('[First Read] Supplement Category');
    // first read
    return supplementCategoryCollection.get();
  }

  void createSupplementCategory(SupplementCategory newCategory) async {
    debugPrint('new supplment category created');
    await supplementCategoryCollection
        .doc(newCategory.docId)
        .set(newCategory.toJson());
  }

  void removeSupplementCategory(
      List<SupplementCategory> supplementCategoryList) async {
    // 마지막 줄 지우기
    await supplementCategoryCollection
        .doc((supplementCategoryList.length + 1).toString())
        .delete();
    // 전부 다시 Set 해주기
    for (SupplementCategory supplementCategory in supplementCategoryList) {
      await supplementCategoryCollection
          .doc(supplementCategory.index.toString())
          .set(supplementCategory.toJson());
      debugPrint('[Remove] Set ${supplementCategory.index}');
    }
  }

  /* 리스트 째로 저장하는 메쏘드 */
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

  // Main Title Collection
  final mainTitleCollection =
      FirebaseFirestore.instance.collection('mainTitle');

  Future<QuerySnapshot> readMainTitle() async {
    debugPrint('[First Read] Supplement Category');
    return mainTitleCollection.get();
  }

  void setMainTitle(String docId, String newTitle) async {
    debugPrint('title changed');
    await mainTitleCollection.doc(docId).set({docId: newTitle});
  }
}
