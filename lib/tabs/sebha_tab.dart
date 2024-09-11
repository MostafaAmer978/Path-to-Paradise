import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:path_to_paradise/home/my_theme.dart';
import 'package:path_to_paradise/providers/my_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> azkar = ["سبحان الله", "الحمدلله", "الله أكبر"];
  int counter = 0;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(provider.getSebhaPath()),
          const SizedBox(
            height: 43,
          ),
          Text("number_of_praises",
              style: Theme.of(context).textTheme.bodyMedium).tr(),
          const SizedBox(
            height: 26,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 70,
                height: 70,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: provider.selectedMode == ThemeMode.light
                      ? MyThemeData.primaryColor
                      : MyThemeData.secondaryColor,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Text(
                "$counter",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: provider.selectedMode == ThemeMode.light
                        ? MyThemeData.darkColor
                        : Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 21
          ),
          Stack(
            alignment: Alignment.center,
            children: [

              Container(
                width: 140,
                height: 60,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: provider.selectedMode == ThemeMode.light
                      ? MyThemeData.primaryColor
                      : MyThemeData.yellowColor,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    counter++;
                    if (counter > 33) {
                      counter = 0;
                      index = index + 1;
                    }
                    if (index == azkar.length) {
                      index = 0;
                    }
                  });
                },
                child: Text(
                  azkar[index],
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: provider.selectedMode == ThemeMode.light
                          ? Colors.white
                          : MyThemeData.darkColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
