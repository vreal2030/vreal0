import 'package:flutter/material.dart';

class MainContentsRepository extends ChangeNotifier {
  List<Map<String, dynamic>> mainColumnList = [
    {
      'index': 1,
      'title': '제목1',
      'subtitle': '부제목입니다1',
      'url': 'https://titann.tistory.com/1',
      'imageUrl': 'https://dummyimage.com/500x500/999/fff.png&text=1',
    },
    {
      'index': 2,
      'title': '제목2',
      'subtitle': '부제목입니다2',
      'url': 'https://titann.tistory.com/2',
      'imageUrl': 'https://dummyimage.com/500x500/999/fff.png&text=2',
    },
    {
      'index': 3,
      'title': '제목3',
      'subtitle': '부제목입니다3',
      'url': 'https://titann.tistory.com/3',
      'imageUrl': 'https://dummyimage.com/500x500/999/fff.png&text=3',
    },
    {
      'index': 4,
      'title': '제목4',
      'subtitle': '부제목입니다4',
      'url': 'https://titann.tistory.com/4',
      'imageUrl': 'https://dummyimage.com/500x500/999/fff.png&text=4',
    },
    {
      'index': 5,
      'title': '제목5',
      'subtitle': '부제목입니다5',
      'url': 'https://titann.tistory.com/5',
      'imageUrl': 'https://dummyimage.com/500x500/999/fff.png&text=5',
    },
    {
      'index': 6,
      'title': '제목6',
      'subtitle': '부제목입니다6',
      'url': 'https://titann.tistory.com/6',
      'imageUrl': 'https://dummyimage.com/500x500/999/fff.png&text=6',
    },
    {
      'index': 7,
      'title': '제목7',
      'subtitle': '부제목입니다7',
      'url': 'https://titann.tistory.com/7',
      'imageUrl': 'https://dummyimage.com/500x500/999/fff.png&text=7',
    },
  ];

  void addColumn(String title, String subtitle, String url, String imageUrl) {
    int newIndex = 1;
    for (var element in mainColumnList) {
      if (element['index'] == newIndex) {
        newIndex++;
      }
    }
    debugPrint('newIndex: $newIndex');

    Map<String, dynamic> newColumn = {
      'index': newIndex,
      'title': title,
      'subtitle': subtitle,
      'url': url,
      'imageUrl': imageUrl,
    };
    mainColumnList.add(newColumn);
    notifyListeners();
  }

  void removeColumn(int index) {
    mainColumnList.removeWhere((element) => element['index'] == index);
    for (var element in mainColumnList) {
      if (element['index'] > index) {
        element['index']--;
      }
    }
    debugPrint('$mainColumnList');
    notifyListeners();
  }
}
