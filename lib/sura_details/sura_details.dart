
import 'package:flutter/material.dart';
import 'package:path_to_paradise/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'sura_details_provider.dart';
import 'sura_model.dart';

class SuraDetails extends StatelessWidget {
  static const String routeName = "SuraDetails";

  const SuraDetails({super.key});



  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)!.settings.arguments as SuraContent;

    return ChangeNotifierProvider<SuraDetailsProvider>(
      create: (context) => SuraDetailsProvider()..loadFile(model.index),
      builder: (context, child) {
        var provider = Provider.of<SuraDetailsProvider>(context);
        var pro = Provider.of<MyProvider>(context);
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(pro.getBackgroundPath()),
            ),
          ),
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                model.name,
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
            ),
            body: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.7),
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },

                itemBuilder: (context, index) {
                  return Text(provider.verses[index],
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(letterSpacing: .3));
                },
                itemCount: provider.verses.length,
              ),
            ),
          ),
        );
      },
    );
  }


}
