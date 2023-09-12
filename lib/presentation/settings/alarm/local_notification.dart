import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/standalone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

initializeNotification() async {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  AndroidInitializationSettings initializationSettingsAndroid =
      const AndroidInitializationSettings('app_icon');

  // IOS
  // DarwinInitializationSettings initializationSettingsDarwin =
  //     const DarwinInitializationSettings(
  //   requestAlertPermission: false,
  //   requestBadgePermission: false,
  //   requestSoundPermission: false,
  // );

  InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    //iOS: initializationSettingsDarwin,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    /*알림 누를때 함수 실행하고싶으면
    (@Deprecated)onSelectNotification: 함수*/
  );

  void sendDailyNotification(int? setHour) async {
    tz.initializeTimeZones();
    final sKorea = tz.getLocation('Asia/Seoul');
    int hour = 20;
    final scheduledDate = tz.TZDateTime(
      sKorea,
      tz.TZDateTime.now(sKorea).year,
      tz.TZDateTime.now(sKorea).month,
      tz.TZDateTime.now(sKorea).day,
      setHour == null ? hour : setHour!, // default : 8PM
    );
    print('$scheduledDate');

    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'test',
      importance: Importance.max,
      priority: Priority.high,
      //ticker: 'ticker',
    );

    // DarwinNotificationDetails darwinNotificationDetails =
    //     const DarwinNotificationDetails(
    //   presentAlert: true,
    //   presentBadge: true,
    //   presentSound: true,
    // );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      //iOS: darwinNotificationDetails,
    );

    // await flutterLocalNotificationsPlugin.show(
    //     0, '매일 오후 8시 알림', '기본 알림으로 설정되었습니다', notificationDetails,
    //     payload: '?');

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      '매일 오후 $setHour시 알림',
      '알림이 설정되었습니다',
      scheduledDate,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.alarmClock, // 저전력 모드일 때에도 알림 실행
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.wallClockTime, // 장치의 현재 시간
      // UILocalNotificationDateInterpretation.absoluteTime, // 절대 시간
      matchDateTimeComponents: DateTimeComponents.time, // 매일 같은 시간에 전송
    );
  }
}
