import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vreal_0/src/repository/global_repository.dart';

class ManageSupplementCategory extends StatelessWidget {
  const ManageSupplementCategory({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    TextEditingController _controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('영양제 비교 카테고리 관리'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                      ...value.supplementCategoryList.map((e) => ListTile(
                            title: Text(e),
                            trailing: e == '블랙마카' ||
                                    e == '아르기닌' ||
                                    e == '쏘팔메토' ||
                                    e == '아연'
                                ? null
                                : IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      value.remove(e);
                                    },
                                  ),
                          ))
                    ],
                  ),
                );
              },
            ),
            // 텍스트필트
            TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: '신규 카테고리명 입력'),
            ),
            // 버튼
            Row(
              children: [
                const Spacer(),
                ElevatedButton(
                    onPressed: () {
                      debugPrint('등록 is Clciked');
                      context.read<GlobalRepository>().create(_controller.text);
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
