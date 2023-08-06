import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class DefultNotification {
  static notificationMethod() async {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    await Future.delayed(const Duration(seconds: 30), () {
      AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: 10,
              channelKey: 'basic_channel',
              title: 'Hussein Salah',
              body:
                  "Experience luxury and comfort at the Nozel hotel - you're invited! Book now for an exceptional stay.",
              actionType: ActionType.Default));
    });
  }

  static CreateNotifition() {
    AwesomeNotifications().initialize(
        // set the icon to null if you want to use the default app icon
        null,
        [
          NotificationChannel(
              channelGroupKey: 'basic_channel_group',
              channelKey: 'basic_channel',
              channelName: 'Basic notifications',
              channelDescription: 'Notification channel for basic tests',
              defaultColor: const Color(0xFF9D50DD),
              ledColor: Colors.white)
        ],
        debug: true);
  }
}
