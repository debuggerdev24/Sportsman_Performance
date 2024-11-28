import 'package:flutter/material.dart';
import 'package:sportperformance/Components/AudioPlayer.dart';
import 'package:sportperformance/Utils/Utils.dart';
import 'package:flutter_translator/flutter_translator.dart';

class AudioBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final translator = TranslatorGenerator.instance;

    return InkWell(
      onTap: () {
        Utils.showMyDialog(context, MyAudioPlayer());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: const [
                  CircleAvatar(
                    radius: 31,
                    backgroundColor: Colors.black,
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/images/audioBook.png"),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      translator.getString("AudioBook.chapter1"),
                      style: Theme.of(context).textTheme!.bodyLarge!.copyWith(
                            fontSize: 14,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(color: Colors.grey),
        ],
      ),
    );
  }
}