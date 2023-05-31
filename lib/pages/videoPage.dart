
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wee/constants.dart';
import 'package:wee/ui_helpers/video_page_ui_helper.dart';
import 'package:wee/ui_helpers/videos_page_ui_helper.dart';
import 'package:wee/widgets/videoElement.dart';

class VideoPage extends StatelessWidget {
  final int index;
  const VideoPage({super.key, required this.index});

  @override
 
  
  @override
  Widget build(BuildContext context) {
    context.read<VideoPageUiHelper>().initPage(index);

    int postsLength = context.select<VideosPageUiHelper, int>(
      (value) => value.shortVideoPosts.length,
    );
   

    return Scaffold(
        backgroundColor: videoPageBackgroundColor,
        body: SafeArea(
          child: Stack(
            children: [
              PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: context.read<VideoPageUiHelper>().pageController,
                scrollDirection: Axis.vertical,
                itemCount: postsLength, // Can be null
                itemBuilder: (context, index) {
                   bool loadingMore = context.read<VideosPageUiHelper>().pageLoading;
                  if (postsLength <index+4 && !loadingMore) {
                    context.read<VideosPageUiHelper>().loadNext();
                  }
                  return VideoElement(
                    index: index,
                  );
                },
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      FontAwesomeIcons.arrowLeft,
                      color: iconColor,
                    )),
              )
            ],
          ),
        ));
  }
}
