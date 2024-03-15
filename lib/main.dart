import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gallery360/pages/splash/splash_screen.dart';
import 'package:gallery360/push/firebase_api.dart';
import 'package:gallery360/util/Util.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:sizer/sizer.dart';
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
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  if (message.notification != null) {
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

  //다국어 처리를 위한 기능 초기화
  await EasyLocalization.ensureInitialized();



  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //WidgetsFlutterBinding.ensureInitialized();
  //await Permission.microphone.request();

  //runApp(const Gallery360Main());

  runApp(EasyLocalization(
    supportedLocales: supportedLocales,
    path: "assets/translations",
    fallbackLocale: const Locale('en','US'),  //설정언어가 없는 경우 기본 언어셋
    //startLocale: const Locale('ko','KR'),  //이설정을 하지 않으면 기기의 기본 언어 셋으로 설정됨
    child: const Gallery360Main(),
  ));
}
//앱에서 지원하는 언어 리스트 변수1
final supportedLocales =[
  const Locale('en','US'),
  const Locale('ko','KR'),
];


class Gallery360Main extends StatelessWidget {
  const Gallery360Main({super.key});

  @override
  Widget build(BuildContext context) {

    FlutterNativeSplash.remove();
    return Sizer(
        builder: (context, orientation, deviceType){
          return GetMaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,


            title: "Gallery360 Mobile",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
                fontFamily: "NotoSans",
                useMaterial3: true
            ),
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: ResponsiveBreakpoints(
                  breakpoints: const [
                    Breakpoint(start: 0, end: 450, name: MOBILE),
                    Breakpoint(start: 451, end: 850, name: TABLET),
                    Breakpoint(start: 851, end: 1920, name: DESKTOP),
                    Breakpoint(start: 1921, end: double.infinity, name: '4K'),
                  ],
                  child: child!,
                ),
              );
            },
            navigatorKey: navigatorKey,
            //home: const DrawerScreen(),
            home: const SplashScreen(),
          );
        }
     );

  }
}
