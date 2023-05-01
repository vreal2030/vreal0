import 'package:flutter/material.dart';

class CompareSupplement extends StatefulWidget {
  const CompareSupplement({super.key});

  @override
  State<CompareSupplement> createState() => _CompareSupplementState();
}

class _CompareSupplementState extends State<CompareSupplement> {
  final List<String> effectList = [
    '에너지',
    '면역강화',
    '항산화',
    '성호르몬 조절',
    '성기능 향상',
    '호르몬 균형 조절',
    '스트레스 감소',
    '기분 개선',
    '뇌기능 향상',
  ];
  final List makkaList = [
    {
      "name": "제품1",
      "mainIngredientPercent": "50%",
      "price": "30",
      "ingredientList": ['블랙마카 추출물', '비타민 B12', '아미노산'],
      "keywordList": ['에너지', '면역 강화', '항산화'],
    },
    {
      "name": "제품2",
      "mainIngredientPercent": "40%",
      "price": "25",
      "ingredientList": ['블랙마카 추출물', '아르기닌', '아스파라진', '베타시토스테롤'],
      "keywordList": ['성호르몬 조절', '성기능 향상', '면역 강화'],
    },
    {
      "name": "제품3",
      "mainIngredientPercent": "30%",
      "price": "20",
      "ingredientList": ['블랙마카 추출물', '이소플라본', '플라보노이드'],
      "keywordList": ['호르몬 균형 조절', '항산화', '면역 강화'],
    },
    {
      "name": "제품4",
      "mainIngredientPercent": "25%",
      "price": "18",
      "ingredientList": ['블랙마카 추출물', '지아닌', '세로토닌'],
      "keywordList": ['스트레스 감소', '기분 개선', '면역 강화'],
    },
    {
      "name": "제품5",
      "mainIngredientPercent": "20%",
      "price": "15",
      "ingredientList": ['블랙마카 추출물', '아르기닌', '오메가-3 지방산'],
      "keywordList": ['성호르몬 조절', '뇌 기능 향상', '면역 강화'],
    },
    {
      "name": "제품6",
      "mainIngredientPercent": "15%",
      "price": "12",
      "ingredientList": ['블랙마카 추출물', '비타민 C', '디알파 토코페롤'],
      "keywordList": ['면역 강화', '항산화', '피로 회복'],
    },
    {
      "name": "제품7",
      "mainIngredientPercent": "10%",
      "price": "10",
      "ingredientList": ['블랙마카 추출물', '비타민 B6', '카르니틴'],
      "keywordList": ['스트레스 감소', '에너지', '면역 강화'],
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('영양제 비교'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                '블랙마카',
                style: TextStyle(
                    fontFamily: 'Gmarket Sans',
                    fontWeight: FontWeight.bold,
                    fontSize: 36),
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              runSpacing: 10,
              spacing: 4,
              children: [...effectList.map((e) => Chip(label: Text(e)))],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: makkaList.length,
                itemBuilder: (context, index) {
                  List<String> keywordList = makkaList[index]['keywordList'];
                  List<String> ingredientList =
                      makkaList[index]['ingredientList'];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 75,
                              width: 75,
                              color: Colors.grey,
                            )
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${makkaList[index]['name']} 이름',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              ingredientList.join(", "),
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            ),
                            const SizedBox(height: 4),
                            Wrap(
                              spacing: 6,
                              runSpacing: 10,
                              children: [
                                ...keywordList.map((e) => Chip(label: Text(e)))
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
