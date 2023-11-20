import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gallery360/Sample/carousel/sub/base_carousel.dart';

class MultipleItemSample extends StatelessWidget {
  const MultipleItemSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MultipleItem Slider"),
      ),
      body: Container(
          child: CarouselSlider.builder(
        itemCount: (imageList.length / 2).round(),
        itemBuilder: (context, index, realIdx){
          final int first = index * 2;
          final int second = first + 1;
          return Row(
            children: [first, second].map((idx){
              return Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Image.network(imageList[idx], fit: BoxFit.cover,),
                ),
              );
            }).toList(),
          );
        },
        options: CarouselOptions(
          height: 300,
        //  autoPlay: true,
          autoPlayInterval: const Duration(milliseconds: 5000),
         // aspectRatio: 1.0,
          enlargeCenterPage: false,
          viewportFraction: 1,
        ),
      )),
    );
  }
}
