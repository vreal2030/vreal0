import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vreal_0/src/repositories/global_repository.dart';

class ManageMainTitle extends StatefulWidget {
  const ManageMainTitle({super.key});

  @override
  State<ManageMainTitle> createState() => _ManageMainTitleState();
}

class _ManageMainTitleState extends State<ManageMainTitle> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('메인 타이틀 관리'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '영양제비교 타이틀',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            // 현재 리스트
            Consumer<GlobalRepository>(
              builder: (context, value, child) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black26, width: 1),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        value.compareSupplementTitle,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Gmarket Sans'),
                      )
                    ],
                  ),
                );
              },
            ),
            // 텍스트필트
            TextField(
              controller: _controller1,
              decoration: const InputDecoration(hintText: '신규 타이틀 입력'),
            ),
            // 버튼
            Row(
              children: [
                const Spacer(),
                ElevatedButton(
                    onPressed: () {
                      debugPrint('등록 is Clciked');
                      context
                          .read<GlobalRepository>()
                          .changeCompareSupplementTitle(_controller1.text);
                    },
                    child: const Text('등록'))
              ],
            ),
            //두번째
            const Text(
              '칼럼리스트 타이틀',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            // 현재 리스트
            Consumer<GlobalRepository>(
              builder: (context, value, child) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black26, width: 1),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        value.columnListTitle,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Gmarket Sans'),
                      )
                    ],
                  ),
                );
              },
            ),
            // 텍스트필트
            TextField(
              controller: _controller2,
              decoration: const InputDecoration(hintText: '신규 타이틀 입력'),
            ),
            // 버튼
            Row(
              children: [
                const Spacer(),
                ElevatedButton(
                    onPressed: () {
                      debugPrint('등록 is Clciked');
                      context
                          .read<GlobalRepository>()
                          .changeColumnListTitle(_controller2.text);
                    },
                    child: const Text('등록'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
