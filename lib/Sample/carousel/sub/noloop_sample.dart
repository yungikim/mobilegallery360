import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gallery360/Sample/carousel/sub/base_carousel.dart';

class NoonLoopingSample extends StatelessWidget {
  const NoonLoopingSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NoonLoopingSample Slider"),
      ),
      body: Container(
        child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            initialPage: 2,
            autoPlay: true,
          ),
          items: imageSliders,
        ),
      ),
    );
  }
}
