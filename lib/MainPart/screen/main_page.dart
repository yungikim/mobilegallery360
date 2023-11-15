import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import '../../data/base_data.dart';

import '../../core/const.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _current = 0;
  final CarouselController _carouselController = CarouselController();
  final SlideController _slideController = SlideController();

  @override
  Widget build(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).isMobile){
      _slideController.firstCarouselHeight.value = 250.0;
    }else{
      _slideController.firstCarouselHeight.value = 500.0;
    }

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    _slideController.firstCarouselHeight.value = height * 0.4;
    _slideController.firstCarouselWidth.value = width * 0.79;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.menu, color: Colors.white,),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Image(
            image: AssetImage("assets/images/logo/logo.png"),
            width: 130,
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search, color: Colors.white,)),
        ],
      ),
      body: Column(
        children: [
          CarouselSlider(
            items: imageList.map((item) => Container(
              margin: const EdgeInsets.only(top: 3.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Stack(
                  children: [
                    Container(
                      height: _slideController.firstCarouselHeight.value,
                      width: _slideController.firstCarouselWidth.value,
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
                autoPlayInterval: const Duration(seconds: 7),
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
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
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
