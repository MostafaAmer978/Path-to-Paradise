import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_to_paradise/ahadeth_model/hadeth_model.dart';
import 'package:path_to_paradise/home/my_theme.dart';
import 'package:provider/provider.dart';
import '../ahadeth_model/hadeth_details.dart';

import '../providers/my_provider.dart';

class AhadethTab extends StatefulWidget {
  const AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
List<HadethModel> ahadethData = [];

  @override
  Widget build(BuildContext context) {
    if(ahadethData.isEmpty){
      loadHadethFile();
    }
    var provider = Provider.of<MyProvider>(context);
    return Column(
      children: [
        Image.asset("assets/images/ahadeth_page.png"),
        Divider(
          thickness: 3,
          color: provider.selectedMode == ThemeMode.light
              ? MyThemeData.primaryColor
              : MyThemeData.yellowColor,
        ),
        Text(
          "ahadeth",
          style: Theme.of(context).textTheme.bodyMedium,
        ).tr(),
        Divider(
          thickness: 3,
          color: provider.selectedMode == ThemeMode.light
              ? MyThemeData.primaryColor
              : MyThemeData.yellowColor,
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, HadethDetails.routeName,
                      arguments: ahadethData[index]);
                    },
                    child: Text(ahadethData[index].title,textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,));
              },
              separatorBuilder: (context, index) => Divider(
                thickness: 1.3,
                indent: MediaQuery.of(context).size.width * .1,
                endIndent: MediaQuery.of(context).size.width * .1,

                color: provider.selectedMode == ThemeMode.light ? MyThemeData.primaryColor : MyThemeData.yellowColor,
              ),
              itemCount: ahadethData.length),
        )
      ],
    );
  }

  loadHadethFile(){
    rootBundle.loadString("assets/sura_names/ahadeth.txt").then((hadethFile) {
      List<String> ahadeth = hadethFile.split("#");
      for(int i = 0 ; i < ahadeth.length ; i++){
        String hadethOne = ahadeth[i];
        List<String> hadethLine = hadethOne.trim().split("\n");
        String title = hadethLine[0];
        hadethLine.removeAt(0);
        List<String> hadethContent =  hadethLine;
        ahadethData.add(HadethModel(title: title, hadethContent: hadethContent));

      }
      setState(() {});
    });

  }
}
