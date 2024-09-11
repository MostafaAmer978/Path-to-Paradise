import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:path_to_paradise/bottom_sheets/language_bottom_sheet.dart';
import 'package:path_to_paradise/bottom_sheets/mode_bottom_sheet.dart';
import 'package:path_to_paradise/home/my_theme.dart';
import 'package:path_to_paradise/providers/my_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return ChangeNotifierProvider<MyProvider>(
      create: (context) => MyProvider(),
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("language", style: Theme.of(context).textTheme.bodyMedium).tr(),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    isDismissible: true,
                    isScrollControlled: false,
                    context: context,
                    builder: (context) {
                      return Container(
                          decoration: BoxDecoration(
                            color: provider.selectedMode == ThemeMode.light
                                ? Colors.white
                                : MyThemeData.secondaryColor,
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          child: const LanguageBottomSheet());
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: provider.selectedMode == ThemeMode.light
                              ? MyThemeData.primaryColor
                              : MyThemeData.yellowColor,
                          width: 2),
                      borderRadius: BorderRadius.circular(22)),
                  child: Text(
                    provider.selectedLanguage == "en" ? "english" : "arabic",
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ).tr(),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Text("mode", style: Theme.of(context).textTheme.bodyMedium).tr(),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    isDismissible: true,
                    isScrollControlled: false,
                    context: context,
                    builder: (context) {
                      return Container(
                        decoration: BoxDecoration(
                          color: provider.selectedMode == ThemeMode.light
                              ? Colors.white
                              : MyThemeData.secondaryColor,
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                        ),
                        child: const ModeBottomSheet(),
                      );
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: provider.selectedMode == ThemeMode.light
                              ? MyThemeData.primaryColor
                              : MyThemeData.yellowColor,
                          width: 2),
                      borderRadius: BorderRadius.circular(22)),
                  child: Text(
                    provider.selectedMode == ThemeMode.light ? "light" : "dark",
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ).tr(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
