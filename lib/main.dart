import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vreal_0/firebase_options.dart';
import 'package:vreal_0/src/pages/splash_page.dart';
import 'package:vreal_0/src/repositories/global_repository.dart';
import 'package:vreal_0/src/repositories/main_contents_repository.dart';

bool isFirstBuild = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // firebase 초기설정 options can't be null
    // https://stackoverflow.com/questions/70232931/firebaseoptions-cannot-be-null-when-creating-the-default-app
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => GlobalRepository()),
    ChangeNotifierProvider(create: (context) => MainContentsRepository()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 최초로 카테고리명 읽어오기
    final globalRepository = context.read<GlobalRepository>();
    final mainContentsRepository = context.read<MainContentsRepository>();
    if (isFirstBuild == true) {
      globalRepository.firstReadCategory();
      globalRepository.firstReadMainTitle();
      mainContentsRepository.firstReadMainColumn();
      isFirstBuild = false;
    }

    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      color: Colors.white,
      theme: ThemeData(
        materialTapTargetSize: MaterialTapTargetSize.padded,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarBrightness: Brightness.light,
            )),
        fontFamily: 'Pretendard',
        colorScheme: ColorScheme.fromSwatch(
            backgroundColor: Colors.white,
            primarySwatch: Colors.grey,
            brightness: Brightness.light),
      ),
      title: 'vreal',
      home: const SplashPage(),
    );
  }
}
