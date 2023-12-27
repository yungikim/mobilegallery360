import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key, required this.message});
  static const route = '/notification-screen';
  RemoteMessage message;

  @override
  Widget build(BuildContext context) {
    //final dynamic message = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('${message.notification?.title}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("여기에 Push클릭시 표시될 화면을 표시해야 한다.", style: TextStyle(fontSize: 14),),
            Text('Push title : ${message.notification?.title}'),
            Text('Push body : ${message.notification?.body}'),
            Text('Psuh data : ${message.data}')
          ],
        ),
      ),
    );
  }
}
