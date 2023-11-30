import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'draw/drawScreen.dart';


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {

  HttpOverrides.global = MyHttpOverrides();  //Network.Image, Http로 ReverseProxy형태의 호출시 SSL에러 처리
  runApp(Gallery360Main());
}

class Gallery360Main extends StatelessWidget {
  Gallery360Main({super.key});



  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Gallery360 Mobile",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        fontFamily: "NotoSans",
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
      home: const DrawerScreen(),
    );
  }
}
