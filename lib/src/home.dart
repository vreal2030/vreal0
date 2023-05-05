import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vreal_0/src/components/center_constrained_box.dart';
import 'package:vreal_0/src/pages/compare_supplement_page.dart';

class Home extends StatelessWidget {
  final List<String> medicineList = ['블랙마카', '아르기닌', '쏘팔메토', '아연'];
  final List<String> columnList = [
    '제목1',
    '제목2',
    '제목3',
    '제목4',
    '제목5',
    '제목6',
    '제목7'
  ];

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CenterConstrainedBox(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            'vreal',
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 24, letterSpacing: -1),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 29, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(
                      child: Text(
                    '영양제 비교',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      fontFamily: 'Gmarket Sans',
                    ),
                  )),
                  const SizedBox(height: 20),
                  ...medicineList.map((e) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(vertical: 30))),
                          onPressed: () {
                            debugPrint(e);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const CompareSupplement(),
                                ));
                          },
                          child: Text(
                            e,
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Gmarket Sans'),
                          )),
                    );
                  }),
                  const SizedBox(height: 10),
                  const Center(
                      child: Text(
                    '정력 칼럼',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      fontFamily: 'Gmarket Sans',
                    ),
                  )),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...columnList.map((e) {
                          return GestureDetector(
                            onTap: () {
                              launchUrl(Uri.parse(
                                  'https://vreal-powerfulman.tistory.com/'));
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(height: 6),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      e,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '$e 부제목이야',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
