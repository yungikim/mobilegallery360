import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'base_carousel.dart';

class PrefetchImageSlider extends StatefulWidget {
  const PrefetchImageSlider({super.key});

  @override
  State<PrefetchImageSlider> createState() => _PrefetchImageSliderState();
}

class _PrefetchImageSliderState extends State<PrefetchImageSlider> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      imageList.forEach((imageUrl) {
        precacheImage(NetworkImage(imageUrl), context);
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prefetch Image Slider"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: 300,
              color: Colors.red,
              margin: EdgeInsets.only(bottom: 30.0),
            ),
            Container(
                child: CarouselSlider.builder(
              itemCount: imageList.length,
              itemBuilder: (context, index, realIdx){
                return Container(
                  child: Center(
                    child: Image.network(imageList[index], fit: BoxFit.cover, width: 1000,),
                  ),
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
            )),
            Container(
              height: 500,
              width: 400,
              color: Colors.amber,
            )
          ],
        ),
      ),
    );
  }
}
