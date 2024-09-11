
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:path_to_paradise/providers/my_provider.dart';
import 'package:provider/provider.dart';
import '../tabs/ahadeth_tab.dart';
import '../tabs/quran_tab.dart';
import '../tabs/radio_tab.dart';
import '../tabs/sebha_tab.dart';
import '../tabs/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  List<Widget> tabs = [
    QuranTab(),
    const AhadethTab(),
    const SebhaTab(),
    RadioTab(),
    const SettingsTab()
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Stack(
      children: [
        Image.asset(
          provider.getBackgroundPath(),
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text("islami").tr(),
          ),
          bottomNavigationBar: BottomNavigationBar(
              iconSize: 30,
              currentIndex: index,
              onTap: (value) {
                index = value;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: const ImageIcon(AssetImage("assets/images/ic_quran.png")),
                    label: "quran".tr()),
                BottomNavigationBarItem(
                    icon: const ImageIcon(AssetImage("assets/images/ic_ahadeth.png")),
                    label: "ahadeth".tr()),
                BottomNavigationBarItem(
                    icon: const ImageIcon(AssetImage("assets/images/ic_sebha.png")),
                    label: "sebha".tr()),
                BottomNavigationBarItem(
                    icon: const ImageIcon(AssetImage("assets/images/ic_radio.png")),
                    label: "radio".tr()),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.settings), label: "settings".tr()),
              ]),
          body: tabs[index],
        ),
      ],
    );
  }
}
