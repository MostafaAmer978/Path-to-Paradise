import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:path_to_paradise/home/my_theme.dart';
import 'package:path_to_paradise/providers/my_provider.dart';
import 'package:provider/provider.dart';

class ModeBottomSheet extends StatelessWidget {
  const ModeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => MyProvider(),
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  provider.changeMode(ThemeMode.light);
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "light",
                      style: provider.selectedMode == ThemeMode.light
                          ? Theme.of(context).textTheme.displayMedium
                          : Theme.of(context).textTheme.bodyLarge,
                    ).tr(),
                    if (provider.selectedMode == ThemeMode.light) ...[
                      const Icon(Icons.done,
                          size: 30, color: MyThemeData.primaryColor)
                    ]
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  provider.changeMode(ThemeMode.dark);
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "dark",
                      style: provider.selectedMode == ThemeMode.dark
                          ? Theme.of(context).textTheme.titleSmall
                          : Theme.of(context).textTheme.titleMedium,
                    ).tr(),
                    if (provider.selectedMode == ThemeMode.dark) ...[
                      const Icon(Icons.done,
                          size: 30, color: MyThemeData.yellowColor)
                    ]
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
