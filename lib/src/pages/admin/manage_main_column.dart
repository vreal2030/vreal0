import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vreal_0/src/components/delete_confirm_alert.dart';
import 'package:vreal_0/src/repositories/main_contents_repository.dart';

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
                              leading: SizedBox(
                                width: 50,
                                child: Image.network(
                                  e.imageUrl,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(e.title),
                              subtitle: Text(e.subtitle),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return DeleteConfirmAlert(
                                        cancelFunction: () {
                                          Navigator.pop(context);
                                        },
                                        deleteFunction: () {
                                          value.removeColumn(e.index);
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  );
                                  debugPrint('${e.title} Column is deleted');
                                },
                              ),
                            ))
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              //입력창
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black26, width: 1),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // 텍스트필트
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        '새 칼럼 등록하기',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: titleController,
                            decoration: const InputDecoration(
                                hintText: '칼럼 타이틀 입력', labelText: '컬럼 타이틀 입력'),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: subtitleController,
                            decoration: const InputDecoration(
                                hintText: '서브타이틀 입력', labelText: '서브타이틀 입력'),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: urlController,
                            decoration: const InputDecoration(
                                hintText: '칼럼 URL 입력', labelText: '칼럼 URL 입력'),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: imageUrlController,
                            decoration: const InputDecoration(
                                hintText: '이미지 URL 입력',
                                labelText: '이미지 URL 입력'),
                          ),
                        ),
                      ],
                    ),
                    // 등록 버튼
                    ElevatedButton(
                        onPressed: () {
                          debugPrint('등록 is Clciked');

                          context.read<MainContentsRepository>().addColumn(
                                titleController.text,
                                subtitleController.text,
                                urlController.text,
                                imageUrlController.text,
                              );
                          titleController.text = '';
                          subtitleController.text = '';
                          urlController.text = '';
                          imageUrlController.text = '';
                        },
                        child: const Text('등록'))
                  ],
                ),
              ),
              // 버튼
              Row(
                children: [],
              )
            ],
          ),
        ),
      ),
    );
  }
}
