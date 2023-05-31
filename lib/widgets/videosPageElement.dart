import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wee/constants.dart';
import 'package:wee/models/short_video_post_model.dart';

class VideosPageElement extends StatelessWidget {
  const VideosPageElement({
    super.key,
    required this.post,
  });

  final ShortVideoPost post;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .5,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                fadeInDuration: Duration.zero,
                fadeOutDuration: Duration.zero,
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl: post.submission!.thumbnail!,
                placeholder: (context, url) => Container(
                  color: const Color.fromARGB(255, 22, 44, 60),
                ),
                errorWidget: (context, url, error) => Center(
                  child: Text(
                    "Something went wrong.",
                    style: TextStyle(
                      color: titleTextColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                      width: MediaQuery.of(context).size.height * .05,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration.zero,
                            fadeOutDuration: Duration.zero,
                            imageUrl: post.creator!.pic!,
                            placeholder: (context, url) => Container(
                                color: const Color.fromARGB(255, 27, 36, 58)),
                            errorWidget: (context, url, error) => Image.asset(
                                "assets/images/profile_placeholder.png"),
                          )
                          ),
                    ),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        child: Text(
                          post.creator?.name ?? "Name",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                  // offset: Offset(2.0, 2.0),
                                  color: Colors.black.withOpacity(0.7),
                                  blurRadius: 1.0,
                                ),
                              ],
                              color: titleTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  post.submission?.title ?? "Title",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(shadows: [
                    Shadow(
                      // offset: Offset(2.0, 2.0),
                      color: Colors.black.withOpacity(0.7),
                      blurRadius: 1.0,
                    ),
                  ], color: titleTextColor, fontSize: 16),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}