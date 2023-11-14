import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OnDemandCarouselSample extends StatelessWidget {
  const OnDemandCarouselSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OnDemandCarousel Slider"),
      ),
      body: CarouselSlider.builder(
        itemCount: 100,
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          autoPlay: true,
        ),
        itemBuilder: (context, index, realIdx){
          return Container(
            child: Text(index.toString()),
          );
        },
      ),
    );
  }
}
