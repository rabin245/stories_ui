import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stories_ui/stories/stories.dart';
import 'package:stories_ui/utils/story_bars.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  int currentStoryIndex = 0;
  final List<Widget> myStories = [
    const MyStory1(),
    const MyStory2(),
    const MyStory3(),
  ];

  List<double> percentWatched = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < myStories.length; i++) {
      percentWatched.add(0);
    }
    _startWatching();
  }

  void _startWatching() {
    Timer.periodic(
      const Duration(milliseconds: 40),
      (timer) {
        setState(() {
          if (percentWatched[currentStoryIndex] + 0.01 < 1) {
            percentWatched[currentStoryIndex] += 0.01;
          } else {
            percentWatched[currentStoryIndex] = 1;
            timer.cancel();

            if (currentStoryIndex < myStories.length - 1) {
              currentStoryIndex++;
              _startWatching();
            } else {
              Navigator.pop(context);
            }
          }
        });
      },
    );
  }

  void _onTapDown(TapDownDetails details) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;

    if (dx < screenWidth / 2) {
      setState(() {
        if (currentStoryIndex > 0) {
          //set previous and current story watched percentage back to 0
          percentWatched[currentStoryIndex - 1] = 0;
          percentWatched[currentStoryIndex] = 0;

          currentStoryIndex--;
        }
      });
    } else {
      setState(() {
        if (currentStoryIndex < myStories.length - 1) {
          percentWatched[currentStoryIndex] = 1;
          currentStoryIndex++;
        } else {
          percentWatched[currentStoryIndex] = 1;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTapDown: _onTapDown,
        child: Scaffold(
          body: Stack(
            children: [
              myStories[currentStoryIndex],
              MyStoryBars(percentWatched: percentWatched),
            ],
          ),
        ),
      ),
    );
  }
}
