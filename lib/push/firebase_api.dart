
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:gallery360/push/page/notification_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../main.dart';


class FirebaseApi{
  final _firebaseMessaging = FirebaseMessaging.instance;

  //로컬 푸쉬 알림에서 안드로이드 채널을 활용한다...
  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications',
    importance: Importance.defaultImportance,
  );
  final _localNotifications = FlutterLocalNotificationsPlugin();

  Future initLocalNotificaions() async{
    const iOS = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('@drawable/launcher_icon');
    const settings = InitializationSettings(android: android, iOS: iOS);

    await _localNotifications.initialize(
      settings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );

    final platform = _localNotifications.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    //! Payload(전송 데이터)를 Stream에 추가합니다.
    final String payload = notificationResponse.payload ?? "";
    if (notificationResponse.payload != null || notificationResponse.payload!.isNotEmpty) {
      print('FOREGROUND PAYLOAD: $payload');
      //streamController.add(payload);
      final message = RemoteMessage.fromMap(jsonDecode(payload));
      handleMessage(message);
    }
  }
  ///////////////////////////////////////////////////////////////////

  void handleMessage(RemoteMessage? message){
    if (message == null) return;
      print("1111111111");
      Get.to(() => NotificationScreen(message: message,));
    //   navigatorKey.currentState?.pushNamed(
    //     NotificationScreen.route,
    //     arguments: message,
    // );
  }

  Future initPushNotifications() async{
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onMessage.listen((message){
      final notification = message.notification;
      if (notification == null) return;
        _localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              _androidChannel.id,
              _androidChannel.name,
              channelDescription: _androidChannel.description,
              icon: '@drawable/launcher_icon'
            ),
          ),
          payload: jsonEncode(message.toMap()),
        );
    });
  }

  Future<void> initNotifications() async{
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print("############################################");
    print('Token : $fCMToken');
    print("############################################");

    initPushNotifications();
    initLocalNotificaions();
  }
}