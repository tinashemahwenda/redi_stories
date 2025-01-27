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
    loadStory();
  }

  Future<void> loadStory() async {
    try {
      final generateStory = await ApiServices.generateStory();
      setState(() {
        story = generateStory;
        isLoading = false;
        print(story);
      });
    } catch (e) {
      setState(() {
        print('$e');
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Text(
                story,
                style: ShadTheme.of(context).textTheme.h1Large,
              ),
      ),
    );
  }
}
