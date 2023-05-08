import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vreal_0/src/models/main_column_model.dart';

class MainContentsService {
  final mainContentsCollection =
      FirebaseFirestore.instance.collection('mainContents');

  Future<QuerySnapshot> readMainColumn() async {
    debugPrint('[First Read] Supplement Category');
    // first read
    return mainContentsCollection.get();
  }

  void createMainColumn(MainColumn newColumn) async {
    debugPrint('new supplment category created');
    await mainContentsCollection.doc(newColumn.docId).set(newColumn.toJson());
  }

  void removeMainColumn(List<MainColumn> mainColumnList) async {
    // 마지막 줄 지우기
    await mainContentsCollection
        .doc((mainColumnList.length + 1).toString())
        .delete();
    // 전부 다시 Set 해주기
    for (MainColumn mainColumn in mainColumnList) {
      await mainContentsCollection
          .doc(mainColumn.index.toString())
          .set(mainColumn.toJson());
      debugPrint('[Remove] Set ${mainColumn.index}');
    }
  }
}
