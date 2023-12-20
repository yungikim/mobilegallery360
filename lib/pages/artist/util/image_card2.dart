import 'package:flutter/material.dart';
import 'package:gallery360/const/const.dart';
import 'package:get/get.dart';
import 'package:gallery360/pages/artist/controller/artist_controller.dart';
import 'image_cache.dart';

class ImageCard2 extends StatelessWidget {
  final int index;
  const ImageCard2({super.key, required this.index});

  @override
  Widget build(BuildContext context) {

    final ArtistController state2 = Get.put(ArtistController());
    final width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
      ),
      child: Column(
        children: [
          ImageLoadCache(
            width: width * 0.49,
            height: 170,
            url:
            "$base_url/artimage/${state2.artists[index].email}/art/preview/${state2.artists[index].avatar}.jpg",
          ),
          Container(
              width: width * 0.49,
              height: 170,
              decoration: BoxDecoration(
                image: DecorationImage(
                  //image: new CachedNetworkImageProvider("https://www.gallery360.co.kr/artimage/${state2.users[index].email}/photo_list/${state2.users[index].email}_gray.jpg"),
                  image: NetworkImage(
                      "$base_url/artimage/${state2.artists[index].email}/photo_list/${state2.artists[index].email}_gray.jpg" ??
                          ""),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "${state2.artists[index].nickname}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${state2.artists[index].ename}",
                      style:
                      const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.vrpano,
                                color: Colors.white, size: 20),
                            Text(
                              state2.artists[index].vrcount ==
                                  null
                                  ? "  "
                                  : state2.artists[index].vrcount
                                  .toString(),
                              style: const TextStyle(
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            const Icon(
                              Icons.article_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                            Text(
                              state2.artists[index].artcount ==
                                  null
                                  ? " "
                                  : state2.artists[index].artcount
                                  .toString(),
                              style: const TextStyle(
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
