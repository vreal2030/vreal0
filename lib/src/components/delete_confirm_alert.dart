import 'package:flutter/material.dart';

class DeleteConfirmAlert extends StatelessWidget {
  const DeleteConfirmAlert({
    Key? key,
    required this.cancelFunction,
    required this.deleteFunction,
  }) : super(key: key);
  final Function cancelFunction;
  final Function deleteFunction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('삭제'),
      content: const Text('정말로 삭제하시겠습니까? 삭제된 내용은 복구되지 않습니다.'),
      actions: [
        TextButton(
          onPressed: () {
            debugPrint('취소 is clicked');
            cancelFunction();
          },
          child: const Text(
            '취소',
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () {
            debugPrint('삭제 is clicked');
            deleteFunction();
          },
          child: const Text(
            '삭제',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
