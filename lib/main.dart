import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gallery360/pages/splash/splash_screen.dart';
import 'package:gallery360/push/firebase_api.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'draw/drawScreen.dart';
import 'firebase_options.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  //await Firebase.initializeApp();

  if (message.notification != null){
    print('Title : ${message.notification?.title}');
    print('Body : ${message.notification?.body}');
    print('Payload : ${message.data}');
    FirebaseApi().handleMessage(message);
  }
}

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  HttpOverrides.global =
      MyHttpOverrides(); //Network.Image, Http로 ReverseProxy형태의 호출시 SSL에러 처리

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //Push Notification Setting
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseApi().initNotifications();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  /////////////////////////////////////////////////

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //WidgetsFlutterBinding.ensureInitialized();
  //await Permission.microphone.request();

  runApp(const Gallery360Main());
}

class Gallery360Main extends StatelessWidget {
  const Gallery360Main({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return GetMaterialApp(
      title: "Gallery360 Mobile",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          fontFamily: "NotoSans",
          useMaterial3: true),
      builder: (context, child) {
        return ResponsiveBreakpoints(
          breakpoints: const [
            Breakpoint(start: 0, end: 450, name: MOBILE),
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
