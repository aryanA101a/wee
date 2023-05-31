import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:wee/constants.dart';
import 'package:wee/models/short_video_post_model.dart';
import 'package:wee/pages/videoPage.dart';
import 'package:wee/ui_helpers/videos_page_ui_helper.dart';
import 'package:wee/widgets/videosPageElement.dart';

class VideosPage extends StatelessWidget {
  const VideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<ShortVideoPost> posts =
        context.read<VideosPageUiHelper>().shortVideoPosts;
    bool loading =
        context.select<VideosPageUiHelper, bool>((value) => value.loading);
    ScrollController scrollController =
        context.read<VideosPageUiHelper>().scrollController;
    int postsLength = context.select<VideosPageUiHelper, int>(
      (value) => value.shortVideoPosts.length,
    );
    return Scaffold(
        backgroundColor: videosPageBackgroundColor,
        body: CustomScrollView(
          controller: scrollController,
          cacheExtent: 10,
          slivers: [
            const SliverAppBar(
              backgroundColor: appBarColor,
              floating: true,
              snap: true,
              leading: Icon(
                Icons.play_arrow_rounded,
                color: appBarIconColor,
                size: 40,
              ),
              title: Text(
                "Wee",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
              ), // ...
            ),
            loading
                ? const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  )
                : SliverList.builder(
                    // shrinkWrap: true,
                    itemCount: postsLength + 1,
                    itemBuilder: (context, index) {
                      if (index < posts.length) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VideoPage(
                                    index: index,
                                  ),
                                ));
                          },
                          child: VideosPageElement(post: posts[index]),
                        );
                      } else {
                        return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                              child: CircularProgressIndicator(
                          )),
                        );
                      }
                    },
                  )
          ],
        ));
  }
}
