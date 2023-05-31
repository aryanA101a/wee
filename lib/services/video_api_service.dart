import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:wee/models/short_video_post_model.dart';

class VideoApiService {
  static Future<List<ShortVideoPost>> getShortVideoPosts(int pageNumber) async {
    Response? response;
    List<ShortVideoPost> shortVideoPosts = [];
    try {
      response = await get(Uri.parse(
          "https://internship-service.onrender.com/videos?page=$pageNumber"));
    } catch (e) {
      log(e.toString());
    }

    if (response != null) {
      Map body = json.decode(response.body);
      List posts = body["data"]["posts"];
      if (body["message"] == "Success" && posts.isNotEmpty) {
        // log(posts.toString());
       
        shortVideoPosts = posts.map((x) => ShortVideoPost.fromJson(x)).toList();
      }
    }

    // log(shortVideoPosts.length.toString());
    return shortVideoPosts;
  }
}
