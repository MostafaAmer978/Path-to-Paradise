import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:path_to_paradise/radio_model/api_manager.dart';
import 'package:path_to_paradise/radio_model/radio_item.dart';
import 'package:path_to_paradise/radio_model/radios_response.dart';

class RadioTab extends StatelessWidget {
  RadioTab({super.key});
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getRadios(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),

          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text(
              "Something went wrong",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          );
        }
        var radioResponse = snapshot.data as RadiosResponse;
        List<Radios> radios = radioResponse.radios ?? [];
        return Column(
          children: [
            Expanded(
                flex: 3, child: Image.asset("assets/images/radio_page.png")),
            Expanded(
              flex: 2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const PageScrollPhysics(),
                itemBuilder: (context, index) {
                  return RadioItem(radio: radios[index],player: player,);
                },itemCount: radios.length,
              ),
            )
          ],
        );
      },
    );
  }
}
