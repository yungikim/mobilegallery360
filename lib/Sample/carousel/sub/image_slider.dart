import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'base_carousel.dart';

class ImageSlider extends StatelessWidget {
  ImageSlider({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Slider Sample"),
      ),
      body: Container(
        child: CarouselSlider(
          options: CarouselOptions(),
          items: imageList.map((item) => Container(
            child: Center(
              child: Image.network(item, fit: BoxFit.cover, width: 10000,),
            ),
          )).toList()
        ),
      ),
    );
  }
}
