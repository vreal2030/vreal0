import 'package:flutter/material.dart';

class SupplementDetail extends StatelessWidget {
  SupplementDetail({
    Key? key,
  }) : super(key: key);

  final supplement = {
    "name": "제품1",
    "mainIngredientPercent": "50%",
    "price": "30",
    "ingredientList": ['블랙마카 추출물', '비타민 B12', '아미노산'],
    "keywordList": ['에너지', '면역 강화', '항산화'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.width,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      CircleAvatar(backgroundColor: Colors.grey),
                      SizedBox(width: 10),
                      Text(
                        'NowFoods',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '${supplement['name']} 이름',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        '4.73',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '(832)',
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.black26,
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '성분',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const IngredientChipsRow(
                    ingredient: '블랙마카 추출물',
                    keywordList: ['면역강화'],
                  ),
                  const IngredientChipsRow(
                    ingredient: '지아닌',
                    keywordList: ['스트레스 감소', '항산화'],
                  ),
                  const IngredientChipsRow(
                    ingredient: '세로토닌',
                    keywordList: ['기분개선'],
                  ),
                  const SizedBox(height: 30),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '가격비교',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const CircleAvatar(
                          backgroundColor: Colors.grey, radius: 12),
                      const SizedBox(width: 10),
                      const Text('G마켓', style: TextStyle(fontSize: 14)),
                      const SizedBox(width: 10),
                      const Text('30,000원',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 10)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100))),
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.blue),
                          foregroundColor:
                              const MaterialStatePropertyAll(Colors.white),
                        ),
                        child: const Text('구매하기'),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IngredientChipsRow extends StatelessWidget {
  const IngredientChipsRow({
    Key? key,
    required this.ingredient,
    required this.keywordList,
  }) : super(key: key);

  final String ingredient;
  final List<String> keywordList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Row(
        children: [
          Text(
            ingredient,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(width: 20),
          ...keywordList.map((e) => Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Chip(
                  label: Text(
                    e,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
