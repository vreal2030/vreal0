import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vreal_0/src/models/main_column_model.dart';
import 'package:vreal_0/src/services/main_contents_service.dart';

class MainContentsRepository extends ChangeNotifier {
  final MainContentsService _mainContentsService = MainContentsService();

  List<MainColumn> mainColumnList = [
    MainColumn(
      index: 1,
      title: '생활 속 정력강화비법 5',
      subtitle: '갱년기 아내에게도 효과만점',
      url: 'https://www.k-health.com/news/articleView.html?idxno=53874',
      imageUrl:
          'https://www.k-health.com/news/photo/202105/53874_52743_1020.jpg',
      docId: '1',
    ),
    MainColumn(
      index: 2,
      title: '남자의 ‘정력’을 위한 음식 3가지',
      subtitle: '강수현·의학전문기자 (RN)',
      url: 'https://mobile.hidoc.co.kr/healthstory/news/C0000004012',
      imageUrl:
          'https://src.hidoc.co.kr/content_images/food_k1_img01_20130927.jpg',
      docId: '2',
    ),
    MainColumn(
      index: 3,
      title: '닭고기가 정력에 좋다고?',
      subtitle: '포인트데일리 칼럼',
      url: 'https://www.thekpm.com/news/articleView.html?idxno=91340',
      imageUrl: 'https://cdn.thekpm.com/news/photo/202107/91340_70782_0558.jpg',
      docId: '3',
    ),
    MainColumn(
      index: 4,
      title: '정력에 좋다고 먹는 음식?',
      subtitle: '말짱 도루묵 입니다. 잘못 먹었다간 되려 발기부전',
      url:
          'http://m.monthly.chosun.com/client/mdaily/daily_view.asp?idx=10321&Newsnumb=20200810321',
      imageUrl:
          'http://www.mindgil.com/editor/cheditor_5/attach/20200811223229_dahmhhrl.jpg',
      docId: '4',
    ),
    MainColumn(
      index: 5,
      title: '정력 강화 음식은?',
      subtitle: '한의타임즈 칼럼',
      url:
          'https://hanitimes.com/%EB%82%A8%EC%84%B1-%ED%99%98%EC%9E%90%EC%97%90%EA%B2%8C-%EC%95%8C%EB%A0%A4%EC%A4%84-%EC%A0%95%EB%A0%A5-%EA%B0%95%ED%99%94-%EC%9D%8C%EC%8B%9D%EC%9D%80/',
      imageUrl:
          'https://hanitimes.com/wp-content/uploads/2020/05/shutterstock_-Heitor-Pergher.jpg',
      docId: '5',
    ),
    MainColumn(
      index: 6,
      title: '직장에서 틈틈히',
      subtitle: '정력 증강법',
      url: 'http://www.ikunkang.com/news/articleView.html?idxno=19770',
      imageUrl: 'http://www.ikunkang.com/news/photo/201703/19770_4156_2336.jpg',
      docId: '6',
    ),
    MainColumn(
      index: 7,
      title: '정력 떨어지는 아홉가지 원인',
      subtitle: '선데이저널 한방칼럼',
      url:
          'https://sundayjournalusa.com/2006/05/28/%ec%a0%95%eb%a0%a5%ec%9d%b4-%eb%96%a8%ec%96%b4%ec%a7%80%eb%8a%94-%ec%95%84%ed%99%89%ea%b0%80%ec%a7%80-%ec%9b%90%ec%9d%b8/',
      imageUrl:
          'https://sundayjournalusa.com/wp-content/uploads/2016/01/1452867505_447886ad072d7-1.jpg',
      docId: '7',
    ),
  ];

  // 카테고리 최초 읽기
  void firstReadMainColumn() async {
    QuerySnapshot snapshot = await _mainContentsService.readMainColumn();
    mainColumnList = snapshot.docs
        .map((doc) => MainColumn(
              index: doc['index'],
              title: doc['title'],
              subtitle: doc['subtitle'],
              url: doc['url'],
              imageUrl: doc['imageUrl'],
              docId: doc.id,
            ))
        .toList();
    debugPrint('FirstRead Complete');
    debugPrint('$mainColumnList');
  }

  void addColumn(String title, String subtitle, String url, String imageUrl) {
    int newIndex = 1;
    for (var element in mainColumnList) {
      if (element.index == newIndex) {
        newIndex++;
      }
    }
    debugPrint('newIndex: $newIndex');

    MainColumn newColumn = MainColumn(
      index: newIndex,
      title: title,
      subtitle: subtitle,
      url: url,
      imageUrl: imageUrl,
      docId: newIndex.toString(),
    );
    mainColumnList.add(newColumn);
    notifyListeners();
    _mainContentsService.createMainColumn(newColumn);
  }

  void removeColumn(int index) {
    mainColumnList.removeWhere((element) => element.index == index);
    for (var element in mainColumnList) {
      if (element.index > index) {
        element.index--;
      }
    }
    debugPrint('$mainColumnList');
    notifyListeners();
    _mainContentsService.removeMainColumn(mainColumnList);
  }
}
