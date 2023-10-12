import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:princess_diaries/presentation/settings/alarm/local_notification.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _hour = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
      ),
      body: Column(
        children: [
          SettingsList(
            lightTheme:
                const SettingsThemeData(settingsListBackground: Colors.white),
            shrinkWrap: true,
            sections: [
              SettingsSection(
                title: const Text(
                  '데이터 백업/복원',
                  style: TextStyle(color: Colors.grey),
                ),
                tiles: [
                  SettingsTile.navigation(
                    title: const Text(
                      '백업/복원',
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: const Icon(
                      Icons.cloud_done_outlined,
                      color: Colors.black,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                    ),
                    onPressed: (context) {
                      context.push('/setting_data');
                    },
                  ),
                ],
              ),
              SettingsSection(
                title: const Text(
                  '기타 설정',
                  style: TextStyle(color: Colors.grey),
                ),
                tiles: [
                  SettingsTile.switchTile(
                    title: const Text(
                      '알림 설정',
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: const Icon(
                      Icons.alarm,
                      color: Colors.black,
                    ),
                    activeSwitchColor: Colors.transparent,
                    initialValue: notificationsEnabled,
                    onPressed: (context) {
                      // TODO : 알림 시간 설정
                    },
                    description: Text('$_hour시'),
                    onToggle: (value) async {
                      setState(() {
                        notificationsEnabled = value;
                      });

                      if (value) {
                        PermissionStatus changedStatus =
                            await Permission.notification.status;
                        if (changedStatus == PermissionStatus.denied) {
                          permissionNotification();
                        }
                        sendDailyNotification(_hour);
                        onNotification();
                      } else {
                        notificationsEnabled = false;
                        FlutterLocalNotificationsPlugin().cancelAll();
                      }
                    },
                  ),
                  SettingsTile.navigation(
                    title: const Text(
                      '테마 선택',
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: const Icon(
                      Icons.palette_outlined,
                      color: Colors.black,
                    ),
                    onPressed: (context) {
                      context.push('/setting_theme');
                    },
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
