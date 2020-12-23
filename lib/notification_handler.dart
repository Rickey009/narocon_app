import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

FirebaseMessaging _firebaseMessaging;

Future<void> initNotification() async {
  _firebaseMessaging.configure(
    onMessage: (Map<String, dynamic> message) async {
      print("onMessage: $message");
    },
    onLaunch: (Map<String, dynamic> message) async {
      print("onLaunch: $message");
    },
    onResume: (Map<String, dynamic> message) async {
      print("onResume: $message");
    },
  );
  _firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound: true, badge: true, alert: true));
  _firebaseMessaging.onIosSettingsRegistered
      .listen((IosNotificationSettings settings) {
    print("Settings registered: $settings");
  });
  _firebaseMessaging.getToken().then((String token) {
    assert(token != null);
    print("Push Messaging token: $token");
  });
  _firebaseMessaging.subscribeToTopic("/topics/all");
}

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  if (message.containsKey('data')) {
    // データメッセージをハンドリング
    final dynamic data = message['data'];
  }

  if (message.containsKey('notification')) {
    // 通知メッセージをハンドリング
    final dynamic notification = message['notification'];
  }
  print('onBackground: $message');
}
