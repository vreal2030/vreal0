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

  List<Map<String, dynamic>> mainColumnList = [
    {
      'title': '제목1',
      'subtitle': '부제목입니다1',
      'url': 'https://titann.tistory.com/1',
      'imageUrl': 'https://dummyimage.com/500x500/999/fff.png&text=1',
    },
    {
      'title': '제목2',
      'subtitle': '부제목입니다2',
      'url': 'https://titann.tistory.com/2',
      'imageUrl': 'https://dummyimage.com/500x500/999/fff.png&text=2',
    },
    {
      'title': '제목3',
      'subtitle': '부제목입니다3',
      'url': 'https://titann.tistory.com/3',
      'imageUrl': 'https://dummyimage.com/500x500/999/fff.png&text=3',
    },
    {
      'title': '제목4',
      'subtitle': '부제목입니다4',
      'url': 'https://titann.tistory.com/4',
      'imageUrl': 'https://dummyimage.com/500x500/999/fff.png&text=4',
    },
    {
      'title': '제목5',
      'subtitle': '부제목입니다5',
      'url': 'https://titann.tistory.com/5',
      'imageUrl': 'https://dummyimage.com/500x500/999/fff.png&text=5',
    },
    {
      'title': '제목6',
      'subtitle': '부제목입니다6',
      'url': 'https://titann.tistory.com/6',
      'imageUrl': 'https://dummyimage.com/500x500/999/fff.png&text=6',
    },
    {
      'title': '제목7',
      'subtitle': '부제목입니다7',
      'url': 'https://titann.tistory.com/7',
      'imageUrl': 'https://dummyimage.com/500x500/999/fff.png&text=7',
    },
  ];
}
