import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:path_to_paradise/home/my_theme.dart';
import 'package:path_to_paradise/providers/my_provider.dart';
import 'package:path_to_paradise/sura_details/sura_details.dart';
import 'package:provider/provider.dart';

import 'ahadeth_model/hadeth_details.dart';
import 'home/home.dart';
import 'home/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MyProvider sharedProvider = MyProvider();
  sharedProvider.setItems();
  await EasyLocalization.ensureInitialized();
  runApp(
    ChangeNotifierProvider<MyProvider>(
      create: (context) => sharedProvider,
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        // <-- change the path of the translation files:
        fallbackLocale: const Locale('en'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: Locale(provider.selectedLanguage),
      theme: MyThemeData.lightMode,
      darkTheme: MyThemeData.darkMode,
      themeMode: provider.selectedMode,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (context) => const SplashPage(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        SuraDetails.routeName: (context) => const SuraDetails(),
        HadethDetails.routeName: (context) => const HadethDetails(),
      },
    );
  }
}
