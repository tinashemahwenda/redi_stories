import 'package:flutter/material.dart';
import 'package:redi_stories/story_page.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(StoryApp());
}

class StoryApp extends StatelessWidget {
  const StoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp(
      home: StoryPage(),
    );
  }
}
