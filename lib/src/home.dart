import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vreal_0/src/components/center_constrained_box.dart';
import 'package:vreal_0/src/models/supplement_category_model.dart';
import 'package:vreal_0/src/pages/admin_home_page.dart';
import 'package:vreal_0/src/pages/compare_supplement_page.dart';
import 'package:vreal_0/src/repositories/global_repository.dart';
import 'package:vreal_0/src/repositories/main_contents_repository.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CenterConstrainedBox(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            'vreal',
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 24, letterSpacing: -1),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 29, 0),
              child:
                  Consumer<GlobalRepository>(builder: (context, value, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // 영양제 비교
                    MainTitleText(
                      title: value.compareSupplementTitle,
                    ),
                    const SizedBox(height: 20),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 0,
                      children: [
                        ...value.supplementCategoryList.map((e) {
                          return CompareSupplementUnit(
                            supplementCategory: e,
                          );
                        }),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // 메인 홈 칼럼 리스트(Row) 시작
                    MainTitleText(
                      title: value.columnListTitle,
                    ),
                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Consumer<MainContentsRepository>(
                          builder: (context, value, child) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...value.mainColumnList.map((e) {
                              String title = e['title'];
                              String subtitle = e['subtitle'];
                              String url = e['url'];
                              String imageUrl = e['imageUrl'];
                              return MainColumnUnit(
                                  url: url,
                                  imageUrl: imageUrl,
                                  title: title,
                                  subtitle: subtitle);
                            })
                          ],
                        );
                      }),
                    ),
                    const SizedBox(height: 30),

                    // 어드민 버튼
                    TextButton(
                        onPressed: () {
                          debugPrint('Admin Clicked');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AdminHome()));
                        },
                        child: const Text('Admin')),
                    const SizedBox(height: 30),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class MainTitleText extends StatelessWidget {
  const MainTitleText({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 36,
          fontFamily: 'Gmarket Sans',
        ),
      ),
    );
  }
}

class CompareSupplementUnit extends StatelessWidget {
  const CompareSupplementUnit({
    super.key,
    required this.supplementCategory,
  });

  final SupplementCategory supplementCategory;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint(supplementCategory.title);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CompareSupplement(
                supplementCategoryName: supplementCategory.title,
              ),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Container(
                color: Colors.black,
                child: Image.network(
                  supplementCategory.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              Container(color: Colors.black.withOpacity(0.4)),
              Center(
                child: Text(
                  supplementCategory.title,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Gmarket Sans',
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainColumnUnit extends StatelessWidget {
  const MainColumnUnit({
    super.key,
    required this.url,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  final String url;
  final String imageUrl;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(Uri.parse(url));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: SizedBox(
          width: 100,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 6),
              Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  subtitle,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, fontSize: 12),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
