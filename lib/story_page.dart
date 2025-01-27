import 'package:flutter/material.dart';
import 'package:redi_stories/services/api_services.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  String story = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  Future<void> loadStory() async {
    try {
      final generateStory = await ApiServices.generateStory();
      setState(() {
        story = generateStory;
        print(story);
      });
    } catch (e) {
      story = 'Failed to load story';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Stories App',
          style: ShadTheme.of(context).textTheme.h1Large,
        ),
      ),
    );
  }
}
