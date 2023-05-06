import 'package:flutter/material.dart';

class GlobalRepository extends ChangeNotifier {
  final List<Map<String, dynamic>> supplementCategoryList = [
    {
      'index': 1,
      'title': '블랙마카',
      'imageUrl':
          'https://mblogthumb-phinf.pstatic.net/20150707_213/olivm_blog_1436210264046LpxSR_JPEG/%BA%ED%B7%A2%B8%B6%C4%AB.jpg?type=w2'
    },
    {
      'index': 2,
      'title': '아르기닌',
      'imageUrl':
          'https://post.healthline.com/wp-content/uploads/2020/08/healthy-high-arginine-foods_thumb-732x549.jpg'
    },
    {
      'index': 3,
      'title': '쏘팔메토',
      'imageUrl':
          'https://src.hidoc.co.kr/image/lib/2022/9/16/1663309728956_0.jpg'
    },
    {
      'index': 4,
      'title': '아연',
      'imageUrl':
          'https://d1ymz67w5raq8g.cloudfront.net/Pictures/460x307/8/5/7/110857_the-elements_250_tcm18-209765.jpg'
    }
  ];

  String compareSupplementTitle = '영양제 비교';
  String columnListTitle = '정력 칼럼';

  void createCategory(String title, String url) {
    int newIndex = 1;
    for (var element in supplementCategoryList) {
      if (element['index'] == newIndex) {
        newIndex++;
      }
    }
    Map<String, dynamic> newCategory = {
      'index': newIndex,
      'title': title,
      'imageUrl': url,
    };
    supplementCategoryList.add(newCategory);
    notifyListeners();
  }

  void removeCategory(int index) {
    supplementCategoryList.removeWhere((element) => element['index'] == index);
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
