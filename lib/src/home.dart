import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'vreal',
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 24, letterSpacing: -1),
        ),
      ),
      body: Padding(
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
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                itemCount: medicineList.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 20);
                },
                itemBuilder: (context, index) {
                  return ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(vertical: 30))),
                      onPressed: () {
                        debugPrint(medicineList[index]);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CompareSupplement(),
                            ));
                      },
                      child: Text(
                        medicineList[index],
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Gmarket Sans'),
                      ));
                },
              ),
            ),
            SizedBox(height: 10),
            const Center(
                child: Text(
              '칼럼',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
                fontFamily: 'Gmarket Sans',
              ),
            )),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...columnList.map((e) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 6),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              '${e}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              '${e} 부제목이야',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    );
                  })
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
