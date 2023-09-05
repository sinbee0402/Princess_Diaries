import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
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
                    initialValue: true,
                    onPressed: (context) {
                      // TODO : 알림 시간 설정
                    },
                    onToggle: (value) {
                      // TODO : 알림 on / off
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
                      // TODO : 테마 선택 AlertDialog
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
