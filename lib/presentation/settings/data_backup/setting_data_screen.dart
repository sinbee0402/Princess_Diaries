import 'package:flutter/material.dart';
import 'package:princess_diaries/presentation/components/future_popup.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingDataScreen extends StatelessWidget {
  const SettingDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('백업/복원'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Google Drive에 데이터를 수동으로 백업하여 핸드폰이 바뀌어도 간편하게 복구할 수 있습니다. 주기적으로 백업해야 데이터를 안전하게 보관할 수 있습니다.',
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(height: 16),
          SettingsList(
            lightTheme:
                const SettingsThemeData(settingsListBackground: Colors.white),
            shrinkWrap: true,
            sections: [
              SettingsSection(
                tiles: [
                  SettingsTile.navigation(
                    title: const Text(
                      'Google Drive 연동',
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: const Icon(
                      Icons.login_outlined,
                      color: Colors.black,
                    ),
                    onPressed: (context) {
                      // TODO : Google Drive 연동 기능
                      showDialog(
                        context: context,
                        builder: (_) {
                          return const FuturePopup();
                        },
                      );
                    },
                  ),
                ],
              ),
              SettingsSection(
                title: const Text(
                  '데이터 백업/복원',
                  style: TextStyle(color: Colors.grey),
                ),
                tiles: [
                  SettingsTile.navigation(
                    title: const Text(
                      '데이터 백업',
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: const Icon(
                      Icons.file_upload_outlined,
                      color: Colors.black,
                    ),
                    onPressed: (context) {
                      // TODO : 데이터 백업 기능
                      showDialog(
                        context: context,
                        builder: (_) {
                          return const FuturePopup();
                        },
                      );
                    },
                  ),
                  SettingsTile.navigation(
                    title: const Text(
                      '데이터 복원',
                      style: TextStyle(color: Colors.black),
                    ),
                    leading: const Icon(
                      Icons.save_alt_outlined,
                      color: Colors.black,
                    ),
                    onPressed: (context) {
                      // TODO : 데이터 복원 기능
                      showDialog(
                        context: context,
                        builder: (_) {
                          return const FuturePopup();
                        },
                      );
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
