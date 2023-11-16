import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gallery360/MainPart/screen/widgets/main_art_list.dart';
import 'package:gallery360/MainPart/screen/widgets/main_carousel.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import '../../data/base_data.dart';

import '../../core/const.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Image(
            image: AssetImage("assets/images/logo/logo.png"),
            width: 130,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
        ],
      ),
      // body: const SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       //MainCarouselWidget(),
      //       Expanded(child: MainArtList()),
      //     ],
      //   )
      // ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: MainCarouselWidget(),
          ),
          SliverToBoxAdapter(
            child: MainArtList(),
          )
        ],
      ),
    );
  }
}
