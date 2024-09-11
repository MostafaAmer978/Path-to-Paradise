import 'package:flutter/material.dart';
import 'package:path_to_paradise/ahadeth_model/hadeth_model.dart';
import 'package:path_to_paradise/providers/my_provider.dart';
import 'package:provider/provider.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "hadethDetails";

  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)!.settings.arguments as HadethModel;
    var provider = Provider.of<MyProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(provider.getBackgroundPath()))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            model.title,
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
        ),
        body: Center(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              height: MediaQuery.of(context).size.height * .6,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Text(
                    model.hadethContent[index],
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(letterSpacing: .3),
                  );
                },
                itemCount: model.hadethContent.length,
              )),
        ),
      ),
    );
  }
}
