import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'base_carousel.dart';

class ComplicateSample extends StatelessWidget {
  ComplicateSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complicate Sample"),
      ),
      body: Container(
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,   //가운데 만 조금 커지는 옵션
           // enlargeStrategy: CenterPageEnlargeStrategy.height,  //높이가 동일한 이미지로 표시하는 옵션
          ),
          items: imageSliders,
        ),
      ),
    );
  }
}
