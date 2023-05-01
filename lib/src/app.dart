import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final List<String> medicineList = ['블랙마카', '아르기닌', '소팔메토', '아연'];

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'vreal',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: Text(
              '영양제 비교',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            )),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                itemCount: medicineList.length,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 30);
                },
                itemBuilder: (context, index) {
                  return ElevatedButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(vertical: 10))),
                      onPressed: () {
                        debugPrint('${medicineList[index]}');
                      },
                      child: Text(
                        '${medicineList[index]}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
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
