import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vreal_0/src/repository/main_contents_repository.dart';

class ManageMainColumn extends StatelessWidget {
  const ManageMainColumn({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    TextEditingController titleController = TextEditingController();
    TextEditingController subtitleController = TextEditingController();
    TextEditingController urlController = TextEditingController();
    TextEditingController imageUrlController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('메인 칼럼 관리'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 현재 리스트
              Consumer<MainContentsRepository>(
                builder: (context, value, child) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black26, width: 1),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                      children: [
                        ...value.mainColumnList.map((e) => ListTile(
                              leading: Image.network(
                                e['imageUrl'],
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              title: Text(e['title']),
                              subtitle: Text(e['subtitle']),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  value.removeColumn(e['index']);
                                  debugPrint('${e['title']} Column is deleted');
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
                controller: titleController,
                decoration: const InputDecoration(hintText: '칼럼 타이틀 입력'),
              ),
              TextField(
                controller: subtitleController,
                decoration: const InputDecoration(hintText: '서브타이틀 입력'),
              ),
              TextField(
                controller: urlController,
                decoration: const InputDecoration(hintText: '칼럼 URL 입력'),
              ),
              TextField(
                controller: imageUrlController,
                decoration: const InputDecoration(hintText: '이미지 URL 입력'),
              ),
              // 버튼
              Row(
                children: [
                  const Spacer(),
                  ElevatedButton(
                      onPressed: () {
                        debugPrint('등록 is Clciked');

                        context.read<MainContentsRepository>().addColumn(
                              titleController.text,
                              subtitleController.text,
                              urlController.text,
                              imageUrlController.text,
                            );
                      },
                      child: const Text('등록'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
