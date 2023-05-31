
import 'package:flutter/material.dart';

class VideoPageUiHelper extends ChangeNotifier {
  PageController _pageController = PageController();
  PageController get pageController => _pageController;

  initPage(int index) {
    _pageController = PageController(initialPage: index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
