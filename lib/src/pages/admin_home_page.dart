import 'package:flutter/material.dart';
import 'package:vreal_0/src/pages/admin/manage_main_column.dart';
import 'package:vreal_0/src/pages/admin/manage_main_title.dart';
import 'package:vreal_0/src/pages/admin/manage_supplement_category.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('vreal Admin'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          children: [
            // 홈 관리
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                '홈 관리',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            ListTile(
              onTap: () {
                debugPrint('메인타이틀 관리 is Clicked');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ManageMainTitle()));
              },
              title: const Text('메인타이틀 관리'),
              trailing: const Icon(Icons.chevron_right),
            ),
            ListTile(
              onTap: () {
                debugPrint('영양제 비교 카테고리 관리 is Clicked');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ManageSupplementCategory()));
              },
              title: const Text('영양제 비교 카테고리 관리'),
              trailing: const Icon(Icons.chevron_right),
            ),
            const SizedBox(height: 20),

            // 매인 컨텐츠 관리
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                '메인 컨텐츠 관리',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            ListTile(
              onTap: () {
                debugPrint('메인 칼럼 관리 is Clicked');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ManageMainColumn()));
              },
              title: const Text('메인 칼럼 관리'),
              trailing: const Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
    );
  }
}
