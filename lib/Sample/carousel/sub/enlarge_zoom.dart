import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gallery360/Sample/carousel/sub/base_carousel.dart';

class EnLargeZoomSample extends StatelessWidget {
  const EnLargeZoomSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EnlargeZoom Slider"),
      ),
      body: Container(
        child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 2.0,
            autoPlay: true,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            enlargeFactor: 0.4,
          ),
          items: imageSliders,
        ),
      ),
    );
  }
}
