import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vreal_0/src/components/center_constrained_box.dart';
import 'package:vreal_0/src/pages/admin_home_page.dart';
import 'package:vreal_0/src/pages/compare_supplement_page.dart';
import 'package:vreal_0/src/repository/global_repository.dart';
import 'package:vreal_0/src/repository/main_contents_repository.dart';

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
                    Center(
                        child: Text(
                      value.compareSupplementTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        fontFamily: 'Gmarket Sans',
                      ),
                    )),
                    const SizedBox(height: 20),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 0,
                      children: [
                        ...value.supplementCategoryList.map((e) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: GestureDetector(
                              onTap: () {
                                debugPrint(e['title']);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CompareSupplement(
                                        supplementCategoryName: e['title'],
                                      ),
                                    ));
                              },
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      color: Colors.black,
                                      child: Image.network(
                                        e['imageUrl'],
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      e['title'],
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
                          );
                        }),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Center(
                        child: Text(
                      value.columnListTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        fontFamily: 'Gmarket Sans',
                      ),
                    )),
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
                              return GestureDetector(
                                onTap: () {
                                  launchUrl(Uri.parse(url));
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: SizedBox(
                                    width: 100,
                                    child: Column(
                                      children: [
                                        Image.network(
                                          imageUrl,
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(height: 6),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            title,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            subtitle,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 12),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })
                          ],
                        );
                      }),
                    ),
                    const SizedBox(height: 30),
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
