import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vreal_0/src/components/delete_confirm_alert.dart';
import 'package:vreal_0/src/repositories/global_repository.dart';

class ManageSupplementCategory extends StatelessWidget {
  const ManageSupplementCategory({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController categoryNameController = TextEditingController();
    TextEditingController imageUrlController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('영양제 비교 카테고리 관리'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                      children: [
                        ...value.supplementCategoryList.map((e) => ListTile(
                              leading: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image.network(
                                    e.imageUrl,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  )),
                              title: Text(e.title),
                              subtitle: Text(
                                e.imageUrl,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              trailing: e.title == '블랙마카' ||
                                      e.title == '아르기닌' ||
                                      e.title == '쏘팔메토' ||
                                      e.title == '아연'
                                  ? null
                                  : IconButton(
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
                                            }, deleteFunction: () {
                                              value.removeCategory(e.index);
                                              Navigator.pop(context);
                                            });
                                          },
                                        );
                                      },
                                    ),
                            ))
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              // 새 카테고리 등록하기
              const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  '새 카테고리 등록하기',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // 텍스트필트
              Row(
                children: [
                  const SizedBox(
                      width: 90,
                      child: Text(
                        '카테고리명',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      )),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: categoryNameController,
                      decoration:
                          const InputDecoration(hintText: '신규 카테고리명 입력'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                      width: 90,
                      child: Text(
                        '이미지 URL',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      )),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: imageUrlController,
                      decoration: const InputDecoration(hintText: '이미지 URL 입력'),
                    ),
                  ),
                ],
              ),
              // 버튼
              Row(
                children: [
                  const Spacer(),
                  ElevatedButton(
                      onPressed: () {
                        debugPrint('등록 is Clciked');
                        context.read<GlobalRepository>().createCategory(
                            categoryNameController.text,
                            imageUrlController.text);
                        categoryNameController.text = '';
                        imageUrlController.text = '';
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
