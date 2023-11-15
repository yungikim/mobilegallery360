import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gallery360/Sample/carousel/sub/basic_sample.dart';
import 'package:gallery360/Sample/carousel/sub/complicate_sample.dart';
import 'package:gallery360/Sample/carousel/sub/complicate_sample2.dart';
import 'package:gallery360/Sample/carousel/sub/enlarge_zoom.dart';
import 'package:gallery360/Sample/carousel/sub/fullscreen_slider.dart';
import 'package:gallery360/Sample/carousel/sub/image_slider.dart';
import 'package:gallery360/Sample/carousel/sub/indicator_sample.dart';
import 'package:gallery360/Sample/carousel/sub/keep_pageview_position.dart';
import 'package:gallery360/Sample/carousel/sub/manuall_controlled_slider.dart';
import 'package:gallery360/Sample/carousel/sub/multi_item.dart';
import 'package:gallery360/Sample/carousel/sub/noloop_sample.dart';
import 'package:gallery360/Sample/carousel/sub/ondemand_sample.dart';
import 'package:gallery360/Sample/carousel/sub/prefetch_image_slider.dart';
import 'package:gallery360/Sample/carousel/sub/vertical_slider.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../core/const.dart';
import '../../main.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();  //Network.Image, Http로 ReverseProxy형태의 호출시 SSL에러 처리
  runApp(TestMain());
}

class TestMain extends StatelessWidget {
  const TestMain({super.key});



  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child){
        return ResponsiveBreakpoints(
          breakpoints: const [
            Breakpoint(start:0, end: 450, name: MOBILE),
            Breakpoint(start: 451, end: 850, name: TABLET),
            Breakpoint(start: 851, end: 1920, name: DESKTOP),
            Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
          child: child!,
        );
      },
      home: TextPage(),

    );
  }
}

class TextPage extends StatelessWidget {
  TextPage({super.key});
  final SlideController _slideController = SlideController();
  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Carousel Test"),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.amber,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Get.to(const CarouselTest());
                    },
                    child: const Text("bassic sample")),
                const SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: () {
                      Get.to(ImageSlider());
                    },
                    child: const Text("Image Slider")),
                const SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: () {
                      Get.to(ComplicateSample());
                    },
                    child: const Text("Complicate Slider")),
                const SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: () {
                      Get.to(ComplicateSample2());
                    },
                    child: const Text("Complicate2 Slider")),
                const SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: () {
                      Get.to(ManuallyControledSlider());
                    },
                    child: const Text("ManuallyControlledSlider Slider")),
                const SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: () {
                      Get.to(NoonLoopingSample());
                    },
                    child: const Text("NoonLoopingSample Slider")),
                const SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: () {
                      Get.to(VerticalSliderSample());
                    },
                    child: const Text("VerticalSliderDemo Slider")),
                const SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: () {
                      Get.to(FullScreenSlider());
                    },
                    child: const Text("FullScreenSlider Slider")),
                const SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: () {
                      Get.to(OnDemandCarouselSample());
                    },
                    child: const Text("OnDemandCarousel Slider")),
                const SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: () {
                      Get.to(IndicatorSliderSample());
                    },
                    child: const Text("Indicator Slider")),
                const SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: () {
                      Get.to(PrefetchImageSlider());
                    },
                    child: const Text("Prefetch Image Slider")),
                const SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: () {
                      Get.to(KeepPageViewPositionSlider());
                    },
                    child: const Text("KeepPageViewPosition Slider")),
                const SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: () {
                      Get.to(MultipleItemSample());
                    },
                    child: const Text("Multiple Item Slider")),
                const SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: () {
                      Get.to(EnLargeZoomSample());
                    },
                    child: const Text("EnlargeZoom Slider")),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

