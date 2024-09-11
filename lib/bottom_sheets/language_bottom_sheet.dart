import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:path_to_paradise/home/my_theme.dart';
import 'package:path_to_paradise/providers/my_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage("en");
              context.setLocale(Locale(provider.selectedLanguage));
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "english",
                  style: TextStyle(
                      color: provider.selectedMode == ThemeMode.light
                          ? (provider.selectedLanguage == "en"
                              ? MyThemeData.primaryColor
                              : MyThemeData.darkColor)
                          : (provider.selectedLanguage == "en"
                              ? MyThemeData.yellowColor
                              : const Color(0xffFFFFFF))),
                ).tr(),
                if (provider.selectedLanguage == "en") ...[
                  Icon(Icons.done,
                      size: 30,
                      color: provider.selectedMode == ThemeMode.light
                          ? MyThemeData.primaryColor
                          : MyThemeData.yellowColor)
                ]
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage("ar");
              context.setLocale(Locale(provider.selectedLanguage));
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "arabic",
                  style: TextStyle(
                      color: provider.selectedMode == ThemeMode.light
                          ? (provider.selectedLanguage == "ar"
                              ? MyThemeData.primaryColor
                              : MyThemeData.darkColor)
                          : (provider.selectedLanguage == "ar"
                              ? MyThemeData.yellowColor
                              : const Color(0xFFFFFFFF))),
                ).tr(),
                if (provider.selectedLanguage == "ar") ...[
                  Icon(Icons.done,
                      size: 30,
                      color: provider.selectedMode == ThemeMode.light
                          ? MyThemeData.primaryColor
                          : MyThemeData.yellowColor)
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
