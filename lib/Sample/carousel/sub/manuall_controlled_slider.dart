import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gallery360/Sample/carousel/sub/base_carousel.dart';

class ManuallyControledSlider extends StatefulWidget {
  const ManuallyControledSlider({super.key});

  @override
  State<ManuallyControledSlider> createState() =>
      _ManuallyControledSliderState();
}

class _ManuallyControledSliderState extends State<ManuallyControledSlider> {
  final CarouselController _carouselController = CarouselController();

  @override
  void initSate() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ManuallControlled Slider Sample"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: imageSliders,
              options: CarouselOptions(
                enlargeCenterPage: true,
                height: 200,
              ),
              carouselController: _carouselController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: ElevatedButton(
                    onPressed: (){
                      _carouselController.previousPage();
                    },
                    child: Text("←"),
                  ),
                ),
                Flexible(
                  child: ElevatedButton(
                    onPressed: (){
                      _carouselController.nextPage();
                    },
                    child: Text("→"),
                  ),
                ),
                ...Iterable<int>.generate(imageList.length).map((int pageIndex) => Flexible(
                  child: ElevatedButton(
                    onPressed: (){
                      _carouselController.animateToPage(pageIndex);
                    },
                    child: Text("$pageIndex"),
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
