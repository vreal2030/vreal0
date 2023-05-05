import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vreal_0/src/components/center_constrained_box.dart';

class SupplementDetail extends StatelessWidget {
  SupplementDetail({
    Key? key,
  }) : super(key: key);

  final Map supplement = {
    'name': '익스트림 블랙마카 1800',
    'brand': '익스트림',
    'mainIngredientPercent': '50%',
    'price': 30000,
    'ingredientList': ['블랙마카 추출물', '비타민 B12', '아미노산'],
    'keywordList': ['에너지', '면역 강화', '항산화'],
  };

  @override
  Widget build(BuildContext context) {
    String name = supplement['name'];
    String brand = supplement['brand'];
    int price = supplement['price'];
    // List ingredientList = supplement['ingredientList'];
    // List keywordList = supplement['keywordList'];

    return CenterConstrainedBox(
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width,
                  constraints: const BoxConstraints(maxHeight: 450),
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const CircleAvatar(backgroundColor: Colors.grey),
                          const SizedBox(width: 10),
                          Text(
                            brand,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 16),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          name,
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      const SizedBox(height: 10),
                      BuySupplementRow(
                        market: 'G마켓',
                        price: price,
                        url:
                            'https://browse.gmarket.co.kr/search?keyword=${supplement['name']}',
                      ),
                      BuySupplementRow(
                        market: '11번가',
                        price: price,
                        url:
                            'https://search.11st.co.kr/Search.tmall?kwd=${supplement['name']}',
                      ),
                      BuySupplementRow(
                        market: '쿠팡',
                        price: price,
                        url:
                            'https://www.coupang.com/np/search?component=&q=${supplement['name']}',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 마켓 - 가격 - 구매하기 Row
class BuySupplementRow extends StatelessWidget {
  const BuySupplementRow({
    Key? key,
    required this.market,
    required this.price,
    required this.url,
  }) : super(key: key);

  final String market;
  final int price;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(backgroundColor: Colors.grey, radius: 12),
        const SizedBox(width: 10),
        Text(market, style: const TextStyle(fontSize: 16)),
        const SizedBox(width: 10),
        Text('$price 원',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const Spacer(),
        TextButton(
          onPressed: () {
            debugPrint('구매하기 is Clicked');
            launchUrl(Uri.parse(url));
          },
          style: ButtonStyle(
            padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 2, horizontal: 16)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100))),
            backgroundColor: const MaterialStatePropertyAll(Colors.blue),
            foregroundColor: const MaterialStatePropertyAll(Colors.white),
          ),
          child: const Text('구매하기'),
        )
      ],
    );
  }
}

// 성분 - 키워드 칩
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
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        children: [
          Text(
            ingredient,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(width: 20),
          ...keywordList.map((e) => Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Chip(
                  label: Text(
                    e,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
