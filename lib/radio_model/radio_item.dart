import 'package:audioplayers/audioplayers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:path_to_paradise/home/my_theme.dart';
import 'package:path_to_paradise/providers/my_provider.dart';
import 'package:provider/provider.dart';

import 'radios_response.dart';

class RadioItem extends StatefulWidget {
  final Radios radio;
  final AudioPlayer player;

  const RadioItem({super.key, required this.radio, required this.player});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  bool isTap = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(
            widget.radio.name ?? "",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  icon: const Icon(Icons.skip_previous),
                  color: provider.selectedMode == ThemeMode.light
                      ? MyThemeData.primaryColor
                      : MyThemeData.yellowColor,
                  iconSize: 50,
                  onPressed: () {
                    //code
                  }),
              IconButton(
                  icon: Icon(isTap ? Icons.pause : Icons.play_arrow),
                  color: provider.selectedMode == ThemeMode.light
                      ? MyThemeData.primaryColor
                      : MyThemeData.yellowColor,
                  iconSize: 70,
                  onPressed: () async {
                    isTap
                        ? await widget.player.pause()
                        : await widget.player
                            .play(UrlSource(widget.radio.url ?? ""));

                    setState(() {
                      isTap = !isTap;
                    });
                  }),
              IconButton(
                  icon: const Icon(Icons.skip_next),
                  color: provider.selectedMode == ThemeMode.light
                      ? MyThemeData.primaryColor
                      : MyThemeData.yellowColor,
                  iconSize: 50,
                  onPressed: () {
                    //code
                  }),
            ],
          )
        ],
      ),
    );
  }
}
