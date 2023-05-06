import 'package:flutter/material.dart';

class GlobalRepository extends ChangeNotifier {
  final List<String> supplementCategoryList = ['블랙마카', '아르기닌', '쏘팔메토', '아연'];

  String compareSupplementTitle = '영양제 비교';
  String columnListTitle = '정력 칼럼';

  void create(newCategory) {
    supplementCategoryList.add(newCategory);
    notifyListeners();
  }

  void remove(category) {
    supplementCategoryList.remove(category);
    notifyListeners();
  }

  void changeCompareSupplementTitle(newTitle) {
    compareSupplementTitle = newTitle;
    notifyListeners();
  }

  void changeColumnListTitle(newTitle) {
    columnListTitle = newTitle;
    notifyListeners();
  }
}
