import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gallery360/Sample/carousel/sub/base_carousel.dart';

class KeepPageViewPositionSlider extends StatelessWidget {
  const KeepPageViewPositionSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KeepPageViewPosition Slider"),
      ),
      body: Container(
        child: ListView.builder(itemBuilder: (context, index){
          if (index == 0){
            return CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                pageViewKey: const PageStorageKey<String>('carousel_slider'),
              ),
              items: imageSliders,
            );
          }else{
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              color: Colors.blue,
              height: 200,
              child: const Center(
                child: Text('other content'),
              ),
            );
          }
        }),
      ),
    );
  }
}
