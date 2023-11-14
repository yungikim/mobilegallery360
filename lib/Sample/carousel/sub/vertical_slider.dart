import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gallery360/Sample/carousel/sub/base_carousel.dart';

class VerticalSliderSample extends StatelessWidget {
  const VerticalSliderSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VerticalSliderDemo Slider"),
      ),
      body: Container(
        child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            scrollDirection: Axis.vertical,
            autoPlay: true,
          ),
          items: imageSliders,
        ),
      ),
    );
  }
}
