import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import 'MainPart/screen/main_page.dart';


void main() {
  runApp(const Gallery360Main());
}

class Gallery360Main extends StatelessWidget {
  const Gallery360Main({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Gallery360 Mobile",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        fontFamily: "Inter",
        useMaterial3: true
      ),
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
      home: const MainPage(),
    );
  }
}
