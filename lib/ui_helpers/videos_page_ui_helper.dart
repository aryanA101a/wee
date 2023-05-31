
import 'package:flutter/material.dart';
import 'package:wee/models/short_video_post_model.dart';
import 'package:wee/services/video_api_service.dart';

class VideosPageUiHelper extends ChangeNotifier {
  int _currentPage = 0;
  final ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;
  List<ShortVideoPost> _shortVideoPosts = [];
  List<ShortVideoPost> get shortVideoPosts => _shortVideoPosts;
  bool _loading = false;
  bool _pageLoading = false;
  bool get loading => _loading;
  bool get pageLoading => _pageLoading;

  VideosPageUiHelper() {
    init();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !pageLoading) {
        loadNext();
      }
    });
  }

  void loadNext() async {
    // log("execute:loadnext");

    _pageLoading = true;
    fetchShortVideoPosts().then((value) {
      _pageLoading = false;
      notifyListeners();
    });
  }

  void init() {
    _loading = true;
    notifyListeners();

    fetchShortVideoPosts().then((value) {
      _loading = false;
      notifyListeners();
    });
  }

  Future fetchShortVideoPosts() async {
    List<ShortVideoPost> data =
        await VideoApiService.getShortVideoPosts(_currentPage);
    if (data.isNotEmpty) {
      _shortVideoPosts.addAll(data);
      _currentPage++;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
