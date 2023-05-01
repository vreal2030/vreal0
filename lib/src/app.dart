import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final List<String> medicineList = ['블랙마카', '아르기닌', '쏘팔메토', '아연'];

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'vreal',
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 24, letterSpacing: -1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
            )
          ],
        ),
      ),
    );
  }
}
