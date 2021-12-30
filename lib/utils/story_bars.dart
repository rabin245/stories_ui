import 'package:flutter/material.dart';
import 'package:stories_ui/utils/progress_bar.dart';

class MyStoryBars extends StatelessWidget {
  MyStoryBars({Key? key, required this.percentWatched}) : super(key: key);
  final List<double> percentWatched;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MyProgressBar(percentWatched: percentWatched[0]),
        ),
        Expanded(
          child: MyProgressBar(percentWatched: percentWatched[1]),
        ),
        Expanded(
          child: MyProgressBar(percentWatched: percentWatched[2]),
        ),
      ],
    );
  }
}
