import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wee/pages/videosPage.dart';
import 'package:wee/ui_helpers/video_page_ui_helper.dart';
import 'package:wee/ui_helpers/videos_page_ui_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => VideosPageUiHelper(),
      ),
      ChangeNotifierProvider(
        create: (context) => VideoPageUiHelper(),
      )
    ],
    child: const MaterialApp(home: HomePage()),);
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const VideosPage();
  }
}
