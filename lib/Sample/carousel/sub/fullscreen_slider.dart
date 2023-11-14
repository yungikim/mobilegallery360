import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'base_carousel.dart';

class FullScreenSlider extends StatelessWidget {
  const FullScreenSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("FullScreenSlider Sample"),
      ),
      body: CarouselSlider(
        options: CarouselOptions(
          height: height,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
          autoPlay: true,
        ),
        items: imageList.map((item) => Container(
          child: Center(
            child: Image.network(item, fit: BoxFit.cover, height: height,),
          ) ,
        )).toList(),
      ),
    );
  }
}
