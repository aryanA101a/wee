import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class VideoProfilePictureElement extends StatelessWidget {
  const VideoProfilePictureElement({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2.5, color: Colors.pink.shade800)),
      child: ClipOval(
          // borderRadius: BorderRadius.circular(16),
          child: SizedBox(
        width: MediaQuery.of(context).size.height * .05,
        height: MediaQuery.of(context).size.height * .05,
        child: CachedNetworkImage(
          fadeInDuration: Duration.zero,
          fadeOutDuration: Duration.zero,
          imageUrl: url,
          placeholder: (context, url) =>
              Container(color: const Color.fromARGB(255, 27, 36, 58)),
          errorWidget: (context, url, error) =>
              Image.asset("assets/images/profile_placeholder.png"),
        ),
      )),
    );
  }
}
