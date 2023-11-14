import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gallery360/Sample/carousel/sub/base_carousel.dart';

class IndicatorSliderSample extends StatefulWidget {
  const IndicatorSliderSample({super.key});

  @override
  State<IndicatorSliderSample> createState() => _IndicatorSliderSampleState();
}

class _IndicatorSliderSampleState extends State<IndicatorSliderSample> {
  int _current = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      imageList.forEach((imageUrl) {
        precacheImage(NetworkImage(imageUrl), context);
      });
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Indicator Slider Sample"),
        ),
        body: Column(
          children: [
            CarouselSlider(
              items: imageSliders,
              carouselController: _carouselController,
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
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
        ));
  }
}
