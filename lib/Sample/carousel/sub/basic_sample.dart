import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class CarouselTest extends StatelessWidget {
  const CarouselTest({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Sample Test")
      ),
      body: CarouselSlider(
        options: CarouselOptions(height: 400.0),
        items: [1, 2, 3, 4, 5].map((i) {
          return Builder(
            builder: (context) {
              return Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: const BoxDecoration(color: Colors.amber),
                child: Text(
                  'text $i',
                  style: const TextStyle(fontSize: 36.0),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}