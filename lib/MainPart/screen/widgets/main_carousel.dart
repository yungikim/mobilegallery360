import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import '../../../data/base_data.dart';
import '../../../core/const.dart';

class MainCarouselWidget extends StatefulWidget {
  const MainCarouselWidget({super.key});

  @override
  State<MainCarouselWidget> createState() => _MainCarouselWidgetState();
}

class _MainCarouselWidgetState extends State<MainCarouselWidget> {
  int _current = 0;
  final CarouselController _carouselController = CarouselController();
  final SlideController _slideController = SlideController();


  @override
  Widget build(BuildContext context) {

    if (ResponsiveBreakpoints.of(context).isMobile) {
      _slideController.firstCarouselHeight.value = 250.0;
    } else {
      _slideController.firstCarouselHeight.value = 500.0;
    }

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    _slideController.firstCarouselHeight.value = height * 0.4;
    _slideController.firstCarouselWidth.value = width * 0.79;

    return Column(
      children: [
        CarouselSlider(
          items: imageList
              .map((item) => Container(
            margin: const EdgeInsets.only(top: 3.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Stack(
                children: [
                  Container(
                    height:
                    _slideController.firstCarouselHeight.value,
                    width:
                    _slideController.firstCarouselWidth.value,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                          image: NetworkImage(item),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(mainMessage[imageList.indexOf(item)],
                                style: const TextStyle(
                                    shadows: [
                                      Shadow(
                                        offset: Offset(3.0, 0.0),
                                        blurRadius: 30.0,
                                        color: Colors.black,
                                      ),
                                    ],
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Text(
                                mainMessage_sub[
                                imageList.indexOf(item)],
                                style: const TextStyle(
                                    shadows: [
                                      Shadow(
                                        offset: Offset(3.0, 0.0),
                                        blurRadius: 30,
                                        color: Colors.black,
                                      )
                                    ],
                                    color: Colors.white,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 50.0,),
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  side: BorderSide(
                                    color: mainMessage_btn_color[_current],
                                    width: 1.0,
                                  )
                              ),
                              child: Text("소개 영상 보기", style: TextStyle(color: mainMessage_btn_color[_current]),),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ))
              .toList(),
          carouselController: _carouselController,
          options: CarouselOptions(
              height: _slideController.firstCarouselHeight.value,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 7),
              enlargeCenterPage: true,
              aspectRatio: 2,
              enlargeFactor: 0.4,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageSliders.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () {
                _carouselController.animateToPage(entry.key);
              },
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
