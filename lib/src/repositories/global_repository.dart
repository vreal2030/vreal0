import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vreal_0/src/models/supplement_category_model.dart';
import 'package:vreal_0/src/services/global_service.dart';

class GlobalRepository extends ChangeNotifier {
  final GlobalService _globalService = GlobalService();
  List<SupplementCategory> supplementCategoryList = [];

  String compareSupplementTitle = '영양제 비교';
  String columnListTitle = '정력 칼럼';

  // 카테고리 최초 읽기
  void firstReadCategory() async {
    QuerySnapshot snapshot = await _globalService.readSupplementCategory();
    supplementCategoryList = snapshot.docs
        .map((doc) => SupplementCategory(
              index: doc['index'],
              title: doc['title'],
              imageUrl: doc['imageUrl'],
              docId: doc.id,
            ))
        .toList();
    debugPrint('FirstRead Complete');
    debugPrint('$supplementCategoryList');
  }

  // 카테고리 생성
  void createCategory(String title, String url) {
    int newIndex = 1;
    for (var element in supplementCategoryList) {
      if (element.index == newIndex) {
        newIndex++;
      }
    }
    SupplementCategory newCategory = SupplementCategory(
      index: newIndex,
      title: title,
      imageUrl: url,
      docId: newIndex.toString(),
    );
    supplementCategoryList.add(newCategory);
    notifyListeners();
    _globalService.createSupplementCategory(newCategory);
  }

  // 카테고리 삭제
  void removeCategory(int index) {
    supplementCategoryList.removeWhere((element) => element.index == index);
    for (var element in supplementCategoryList) {
      if (element.index > index) {
        element.index--;
      }
    }
    notifyListeners();
    _globalService.removeSupplementCategory(supplementCategoryList);
  }

  // Main Title
  // 타이틀 최초 읽기
  void firstReadMainTitle() async {
    QuerySnapshot snapshot = await _globalService.readMainTitle();
    compareSupplementTitle = snapshot.docs.firstWhere((e) =>
            e.id == 'compareSupplementTitle')['compareSupplementTitle'] ??
        '영양제 비교';
    columnListTitle = snapshot.docs
            .firstWhere((e) => e.id == 'columnListTitle')['columnListTitle'] ??
        '정력 칼럼';
    debugPrint('[First Read]compareSupplementTitle: $compareSupplementTitle');
    debugPrint('[First Read]columnListTitle: $columnListTitle');
  }

  // 영양제 비교 제목 변경
  void changeCompareSupplementTitle(newTitle) {
    compareSupplementTitle = newTitle;
    notifyListeners();
    _globalService.setMainTitle('compareSupplementTitle', newTitle);
  }

  // 컬럼리스트 제목 변경
  void changeColumnListTitle(newTitle) {
    columnListTitle = newTitle;
    notifyListeners();
    _globalService.setMainTitle('columnListTitle', newTitle);
  }
}
