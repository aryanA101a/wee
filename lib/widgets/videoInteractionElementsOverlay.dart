import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wee/constants.dart';
import 'package:wee/models/short_video_post_model.dart';
import 'package:wee/widgets/reactionElement.dart';
import 'package:wee/widgets/videoProfilePictureElement.dart';

class VideoInteractionElementsOverlay extends StatelessWidget {
  final ShortVideoPost post;
  const VideoInteractionElementsOverlay({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
              leading: VideoProfilePictureElement(url: post.creator!.pic!),
              title: Text(
                post.creator?.name ?? "Name",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: titleTextColor,
                    shadows: [
                      Shadow(
                        // offset: Offset(2.0, 2.0),
                        color: textShadowColor,
                        blurRadius: 1.0,
                      ),
                    ],
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                post.submission?.title ?? "",
                style: TextStyle(color: subtitleTextColor, fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        padding:
                            const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                        decoration: const BoxDecoration(
                          color: Colors.black26,
                        ),
                        child: ReactionElement(
                          icon: FontAwesomeIcons.solidHeart,
                          reactionText: post.reaction?.count.toString() ?? "",
                        ),
                      ),
                    ),
                  ),
                ),
                ReactionElement(
                  icon: FontAwesomeIcons.solidCommentDots,
                  reactionText: post.comment?.count.toString() ?? "",
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: FaIcon(
                    FontAwesomeIcons.share,
                    color: iconColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
