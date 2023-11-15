import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gallery360/core/const.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../../main.dart';
import 'base_carousel.dart';

class IndicatorSliderSample extends StatefulWidget {
  const IndicatorSliderSample({super.key});

  @override
  State<IndicatorSliderSample> createState() => _IndicatorSliderSampleState();
}

class _IndicatorSliderSampleState extends State<IndicatorSliderSample> {
  int _current = 0;
  final CarouselController _carouselController = CarouselController();
  final SlideController _slideController = SlideController();

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   imageList.forEach((imageUrl) {
    //     precacheImage(NetworkImage(imageUrl), context);
    //   });
    // });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    if (ResponsiveBreakpoints.of(context).isMobile){
      print("mobile mode");
      _slideController.firstCarouselHeight.value = 250.0;
    }else{
      print("Tablet mode");
      _slideController.firstCarouselHeight.value = 500.0;
    }

    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text("Indicator Slider Sample"),
        ),
        body: Column(
          children: [
            CarouselSlider(
              items: imageList.map((item) => Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Stack(
                    children: [
                      Container(
                        height: _slideController.firstCarouselHeight.value,
                        width: width * 0.78,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            image: DecorationImage(
                              image: NetworkImage(item),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("${mainMessage[imageList.indexOf(item)]}",style: const TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold)),
                              //Text("22222222222",style: const TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )).toList(),
              carouselController: _carouselController,
              options: CarouselOptions(
                height: _slideController.firstCarouselHeight.value,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2,
                enlargeFactor: 0.4,
                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                onPageChanged: (index, reason){
                  setState(() {
                    _current = index;
                  });
                }
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageSliders.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: (){
                    print(entry.key);
                    _carouselController.animateToPage(entry.key);
                  },
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black
                      ).withOpacity(_current == entry.key ? 0.9 : 0.4)
                    ),
                  ),
                );
              }).toList(),
            )
          ],
        )
    );
  }
}
