// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:flutter_upgrade_version/flutter_upgrade_version.dart';
//
// import 'dart:developer';
// import 'package:html/dom.dart';
// import 'package:upgrader/upgrader.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   PackageInfo _packageInfo = PackageInfo();
//
//   @override
//   void initState() {
//     super.initState();
//     getPackageData();
//   }
//
//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> getPackageData() async {
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     // We also handle the message potentially returning null.
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//     _packageInfo = await PackageManager.getPackageInfo();
//
//
//
//     String myAppBundleId = "com.gallery360.mobile";
//     String? storeVersion;
//     if (Platform.isAndroid) {
//       PlayStoreSearchAPI playStoreSearchAPI = PlayStoreSearchAPI();
//       Document? result = await playStoreSearchAPI.lookupById(myAppBundleId, country: 'US');
//       if (result != null) storeVersion = playStoreSearchAPI.version(result);
//       print("=========================================");
//       print((_packageInfo.toJson()["version"]));
//       print(storeVersion);
//
//
//
//       print("=========================================");
//     } else if (Platform.isIOS) {
//       ITunesSearchAPI iTunesSearchAPI = ITunesSearchAPI();
//       Map<dynamic, dynamic>? result =
//       await iTunesSearchAPI.lookupByBundleId(myAppBundleId, country: 'US');
//       if (result != null) storeVersion = iTunesSearchAPI.version(result);
//       print("=========================================");
//       print('AppStore version: $storeVersion}');
//       print("=========================================");
//     } else {
//       storeVersion = null;
//     }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//
//
//       ),
//     );
//   }
// }